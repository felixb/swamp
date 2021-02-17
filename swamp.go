package main

import (
	"bufio"
	"context"
	"flag"
	"fmt"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/sts"
	"github.com/aws/aws-sdk-go-v2/service/sts/types"
	"os"
	"os/exec"
	"strings"
	"time"
)

func die(msg string, err error) {
	dieSlow(msg, "", err)
}

func dieSlow(msg, longMsg string, err error) {
	fmt.Fprintln(os.Stderr, msg+":")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, err)
	if longMsg != "" {
		fmt.Fprintln(os.Stderr, "")
		fmt.Fprintln(os.Stderr, longMsg)
	}
	os.Exit(1)
}

func getCallerId(ctx context.Context, svc *sts.Client) *sts.GetCallerIdentityOutput {
	output, err := svc.GetCallerIdentity(ctx, &sts.GetCallerIdentityInput{})
	if err != nil {
		die("Error fetching caller id", err)
	}

	return output
}

func cleanTokenCode(tokenCode string) string {
	return strings.Trim(tokenCode, " \r\n")
}

func fetchTokenCode(tokenSerialNumber string, cmd string) string {
	printer.Printf("Obtaining mfa token for: %s\n", tokenSerialNumber)
	if output, err := exec.Command("/bin/sh", "-c", cmd).Output(); err != nil {
		die("Error obtaining mfa token", err)
		return ""
	} else {
		return string(output)
	}
}

func askForTokenCode(tokenSerialNumber string) string {
	reader := bufio.NewReader(os.Stdin)
	fmt.Printf("Enter mfa token for %s: ", tokenSerialNumber)
	if tokenCode, err := reader.ReadString('\n'); err != nil {
		die("Error reading mfa token", err)
		return ""
	} else {
		return tokenCode
	}
}

func getTokenCode(swampConfig *SwampConfig) string {
	var tokenCode string
	if swampConfig.mfaExec != "" {
		tokenCode = fetchTokenCode(swampConfig.tokenSerialNumber, swampConfig.mfaExec)
	} else {
		tokenCode = askForTokenCode(swampConfig.tokenSerialNumber)
	}
	return cleanTokenCode(tokenCode)
}

func validateSessionToken(ctx context.Context, awsConfig aws.Config) bool {
	svc := sts.NewFromConfig(awsConfig)
	_, err := svc.GetCallerIdentity(ctx, &sts.GetCallerIdentityInput{})
	return err == nil
}

func guessCurrentProfile(swampConfig *SwampConfig) string {
	if swampConfig.profile != "" {
		return swampConfig.profile
	}

	profileFromEnv := os.Getenv("AWS_PROFILE")
	if profileFromEnv != "" {
		return profileFromEnv
	}

	return "default"
}

func getSessionToken(ctx context.Context, swampConfig *SwampConfig, awsConfig aws.Config) *types.Credentials {
	svc := sts.NewFromConfig(awsConfig)
	tokenCode := getTokenCode(swampConfig)
	output, err := svc.GetSessionToken(ctx, &sts.GetSessionTokenInput{
		DurationSeconds: aws.Int32(int32(swampConfig.intermediateDuration)),
		SerialNumber:    &swampConfig.tokenSerialNumber,
		TokenCode:       &tokenCode,
	})
	if err != nil {
		dieSlow("Error getting session token", fmt.Sprintf(`Make sure your current profile %s is valid and allows running "aws sts get-session-token".`, guessCurrentProfile(swampConfig)), err)
	}

	return output.Credentials
}

func getIntermediateSessionOptions(ctx context.Context, swampConfig *SwampConfig) aws.Config {
	return newSessionOptions(ctx, swampConfig.intermediateProfile, swampConfig.region)
}

func getBaseSessionOptions(ctx context.Context, swampConfig *SwampConfig) aws.Config {
	return newSessionOptions(ctx, swampConfig.profile, swampConfig.region)
}

func newSessionOptions(ctx context.Context, profile, region string) aws.Config {
	if cfg, err := config.LoadDefaultConfig(ctx, config.WithRegion(region), config.WithSharedConfigProfile(profile)); err != nil {
		die("Error loading aws config", err)
		return cfg
	} else {
		return cfg
	}
}

// validate session token and request a new one if it's invalid.
// write target profile into .aws/credentials
func ensureSessionTokenProfile(ctx context.Context, swampConfig *SwampConfig, pw *ProfileWriter) {
	printer.Printf("Checking if profile %s is still valid\n", swampConfig.intermediateProfile)
	if validateSessionToken(ctx, getIntermediateSessionOptions(ctx, swampConfig)) {
		printer.Printf("Session token for profile %s is still valid\n", swampConfig.intermediateProfile)
	} else {
		awsConfig := getBaseSessionOptions(ctx, swampConfig)
		cred := getSessionToken(ctx, swampConfig, awsConfig)
		if err := pw.WriteProfile(cred, swampConfig.intermediateProfile, awsConfig.Region); err != nil {
			die("Error writing profile", err)
		}
	}
}

func assumeRole(ctx context.Context, svc *sts.Client, roleArn, roleSessionName *string, duration *int32) *types.Credentials {
	output, err := svc.AssumeRole(ctx, &sts.AssumeRoleInput{
		RoleArn:         roleArn,
		RoleSessionName: roleSessionName,
		DurationSeconds: duration,
	})
	if err != nil {
		dieSlow("Error assuming role", fmt.Sprintf(`Make sure your current profile is valid and allows running "aws sts assume-role --role-arn %s"`, *roleArn), err)
	}

	return output.Credentials
}

// assume-role into target account and write target profile into .aws/credentials
func ensureTargetProfile(ctx context.Context, swampConfig *SwampConfig, pw *ProfileWriter, awsConfig aws.Config) {
	svc := sts.NewFromConfig(awsConfig)

	userId := getCallerId(ctx, svc).Arn
	parts := strings.Split(*userId, "/")
	roleSessionName := parts[len(parts)-1]

	cred := assumeRole(ctx, svc, swampConfig.GetRoleArn(), &roleSessionName, aws.Int32(int32(swampConfig.targetDuration)))
	if err := pw.WriteProfile(cred, swampConfig.targetProfile, awsConfig.Region); err != nil {
		die("Error writing profile", err)
	}
}

func cleanCredentialsFromEnv(env []string) []string {
	ret := env

	for _, key := range [...]string{"AWS_ACCESS_KEY_ID=", "AWS_SECRET_ACCESS_KEY=", "AWS_SESSION_TOKEN="} {
		for i, e := range ret {
			if strings.HasPrefix(e, key) {
				ret = append(ret[:i], ret[i+1:]...)
				break
			}
		}
	}

	return ret
}

func execCommand(swampConfig *SwampConfig) error {
	c := exec.Command("/bin/sh", "-c", swampConfig.exec)
	c.Env = append(cleanCredentialsFromEnv(os.Environ()), fmt.Sprintf("AWS_PROFILE=%s", swampConfig.targetProfile))
	c.Stdin = os.Stdin
	c.Stdout = os.Stdout
	c.Stderr = os.Stderr
	return c.Run()
}

func main() {
	// set up command line flags
	swampConfig := NewSwampConfig()
	swampConfig.SetupFlags()
	flag.Parse()

	// setup logging
	if swampConfig.quiet {
		printer.SetOff(true)
	}

	// check user input on command line flags
	if err := swampConfig.Validate(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		flag.Usage()
		os.Exit(1)
	}
	if swampConfig.aliasConfig == "" {
		assume(context.Background(), swampConfig)
	} else {
		if err := generateAliases(os.Stdout, swampConfig.aliasConfig); err != nil {
			die("Error generating alias swampConfig", err)
		}
	}
}

func assume(ctx context.Context, swampConfig *SwampConfig) {
	baseProfile := swampConfig.profile
	if swampConfig.tokenSerialNumber != "" {
		baseProfile = swampConfig.intermediateProfile
	}
	pw, err := NewProfileWriter()
	if err != nil {
		die("Error initializing profile writer", err)
	}
	for {
		if swampConfig.tokenSerialNumber != "" {
			// get intermediate session token with mfa, use that to assume role into target account
			ensureSessionTokenProfile(ctx, swampConfig, pw)
		}

		if swampConfig.targetRole != "" {
			ensureTargetProfile(ctx, swampConfig, pw, newSessionOptions(ctx, baseProfile, swampConfig.region))

			if swampConfig.exec != "" {
				if err := execCommand(swampConfig); err != nil {
					die(fmt.Sprintf(`Error running command ""%s" with AWS profile "%s"`, swampConfig.exec, swampConfig.targetProfile), err)
				} else {
					printer.Printf("Executed \"%s\" sucessfully\n", swampConfig.exec)
				}
			}
		}

		if !swampConfig.renew {
			break
		}
		time.Sleep(time.Second * time.Duration(swampConfig.targetDuration/2))
	}
}
