package main

import (
	"bufio"
	"flag"
	"fmt"
	"path/filepath"
	"os"
	"os/user"

	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/sts"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/go-ini/ini"
	"strings"
	"time"
)

const (
	INTERMEDIATE_SESSION_TOKEN_DURATION = int64(12 * 60 * 60)
	TARGET_SESSION_TOKEN_DURATION       = int64(60 * 60)
)

var (
	version string
)

func flagUsage() {
	fmt.Fprintf(os.Stderr, "Version of %s: %s\n", os.Args[0], version)
	fmt.Fprintf(os.Stderr, "Usage of %s:\n", os.Args[0])
	flag.PrintDefaults()
}

func die(msg string, err error) {
	fmt.Fprintf(os.Stderr, msg+": %v\n", err)
	os.Exit(1)
}

func checkStringFlagNotEmpty(name string, f *string) {
	if f == nil || *f == "" {
		fmt.Fprintf(os.Stderr, "Missing mandatory parameter: %s\n", name)
		flag.Usage()
		os.Exit(1)
	}
}

func updateKey(sec *ini.Section, name string, value *string) {
	key, err := sec.GetKey(name)
	if err != nil {
		_, err := sec.NewKey(name, *value)
		if err != nil {
			die("Error creating config key", err)
		}
	} else {
		key.SetValue(*value)
	}
}

func writeProfile(cred *sts.Credentials, targetProfile, region *string) {
	usr, err := user.Current()
	if err != nil {
		die("Error fetching home dir", err)
	}

	awsPath := filepath.Join(usr.HomeDir, ".aws")
	filename := filepath.Join(awsPath, "credentials")

	cfg, err := ini.Load(filename)
	if err != nil {
		fmt.Printf("Unable to find credentials file %s. Creating new file.\n", filename)

		if err := os.MkdirAll(awsPath, os.ModePerm); err != nil {
			die("Error creating aws config path", err)
		}
		cfg = ini.Empty()
	}
	sec, err := cfg.GetSection(*targetProfile)
	if err != nil {
		sec, err = cfg.NewSection(*targetProfile)
		if err != nil {
			die("Error creating new section", err)
		}
	}
	updateKey(sec, "region", region)
	updateKey(sec, "aws_access_key_id", cred.AccessKeyId)
	updateKey(sec, "aws_secret_access_key", cred.SecretAccessKey)
	updateKey(sec, "aws_session_token", cred.SessionToken)

	if err := cfg.SaveTo(filename); err != nil {
		die("Error writing credentials file", err)
	}

	fmt.Printf("Wrote session token for profile %s\n", *targetProfile)
	fmt.Printf("Token is valid until: %v\n", cred.Expiration)
}

func getCallerId(svc *sts.STS) *sts.GetCallerIdentityOutput {
	output, err := svc.GetCallerIdentity(&sts.GetCallerIdentityInput{})
	if err != nil {
		die("Error fetching caller id", err)
	}

	return output
}

func getTokenCode(tokenSerialNumber *string) *string {
	if tokenSerialNumber == nil {
		return nil
	}

	reader := bufio.NewReader(os.Stdin)
	fmt.Printf("Enter mfa token for %s: ", *tokenSerialNumber)
	tokenCode, err := reader.ReadString('\n')
	if err != nil {
		die("Error reading mfa token", err)
	}
	tokenCode = strings.Trim(tokenCode, "\n")
	return &tokenCode
}

func validateSessionToken(options session.Options) bool {
	sess := session.Must(session.NewSessionWithOptions(options))
	svc := sts.New(sess)
	_, err := svc.GetCallerIdentity(&sts.GetCallerIdentityInput{})
	return err == nil
}

func getSessionToken(options session.Options, duration *int64, tokenSerialNumber *string) *sts.Credentials {
	sess := session.Must(session.NewSessionWithOptions(options))
	svc := sts.New(sess)
	output, err := svc.GetSessionToken(&sts.GetSessionTokenInput{
		DurationSeconds: duration,
		SerialNumber:    tokenSerialNumber,
		TokenCode:       getTokenCode(tokenSerialNumber),
	})
	if err != nil {
		die("Error assuming role", err)
	}

	return output.Credentials
}

// validate session token and request a new one if it's invalid.
// write target profile into .aws/credentials
func ensureSessionTokenProfile(profile, targetProfile, tokenSerialNumber *string, duration *int64, region *string) {
	if validateSessionToken(session.Options{Config: aws.Config{Region: region},
		Profile: *targetProfile,}) {
		fmt.Printf("Session token for profile %s is still valid\n", *targetProfile)
	} else {
		cred := getSessionToken(session.Options{
			Config:  aws.Config{Region: region},
			Profile: *profile,
		}, duration, tokenSerialNumber)
		writeProfile(cred, targetProfile, region)
	}
}

func assumeRole(svc *sts.STS, roleArn, roleSessionName *string, duration *int64) *sts.Credentials {
	output, err := svc.AssumeRole(&sts.AssumeRoleInput{
		RoleArn:         roleArn,
		RoleSessionName: roleSessionName,
		DurationSeconds: duration,
	})
	if err != nil {
		die("Error assuming role", err)
	}

	return output.Credentials
}

// assume-role into target account and write target profile into .aws/credentials
func ensureTargetProfile(sess *session.Session, targetProfile, targetRole *string, duration *int64) {
	svc := sts.New(sess)

	userId := getCallerId(svc).Arn
	roleSessionName := strings.Split(*userId, "/")[1]

	cred := assumeRole(svc, targetRole, &roleSessionName, duration)
	writeProfile(cred, targetProfile, sess.Config.Region)
}

func writeProfileToFile(export, profile string) {
	file, err := os.Create(export)
	if err != nil {
		die("Error creating temp file for setting profile", err)
	}
	defer file.Close()

	fmt.Fprintf(file, "export AWS_PROFILE=%s\n", profile)
}

func main() {
	// set up command line flags
	targetAccount := flag.String("account", "", "AWS account")
	intermediateProfile := flag.String("intermediate-profile", "session-token", "Intermediate AWS CLI profile")
	intermediateDuration := flag.Int64("intermediate-duration", INTERMEDIATE_SESSION_TOKEN_DURATION, "Token duration in seconds for intermediate profile")
	targetProfile := flag.String("target-profile", "", "Write this AWS CLI profile")
	targetRole := flag.String("target-role", "", "AWS role to assume (can either be ARN or name)")
	targetDuration := flag.Int64("target-duration", TARGET_SESSION_TOKEN_DURATION, "Token duration in seconds for target profile")
	profile := flag.String("profile", "default", "AWS CLI profile")
	region := flag.String("region", "eu-central-1", "AWS region")
	tokenSerialNumber := flag.String("mfa-device", "", "MFA device arn")
	useInstanceProfile := flag.Bool("instance", false, "Use instance profile")
	renew := flag.Bool("renew", false, "renew token every duration/2")
	exportProfile := flag.Bool("export-profile", false, "set AWS_PROFILE in environment")
	exportFile := flag.String("export-file", "/tmp/current_swamp_profile", "File to write AWS_PROFILE to, defaults to '/tmp/current_swamp_profile'")
	flag.Usage = flagUsage
	flag.Parse()

	// check user input on command line flags
	var roleArn string
	baseProfile := profile
	checkStringFlagNotEmpty("target-profile", targetProfile)
	checkStringFlagNotEmpty("target-role", targetRole)
	checkStringFlagNotEmpty("profile", profile)
	checkStringFlagNotEmpty("region", region)

	if *exportProfile && *renew {
		fmt.Fprintln(os.Stderr, "Using renew and export-profile is mutual exclusive")
		flag.Usage()
		os.Exit(1)
	}

	if strings.HasPrefix(*targetRole, "arn:aws:iam::") {
		roleArn = *targetRole
	} else {
		checkStringFlagNotEmpty("account", targetAccount)
		roleArn = fmt.Sprintf("arn:aws:iam::%s:role/%s", *targetAccount, *targetRole)
	}

	if *useInstanceProfile {
		if *tokenSerialNumber != "" {
			fmt.Fprintln(os.Stderr, "Using MFA and instance profile is mutual exclusive")
			flag.Usage()
			os.Exit(1)
		}
		if *profile != "default" {
			fmt.Fprintln(os.Stderr, "Using a profile and instance profile is mutual exclusive")
			flag.Usage()
			os.Exit(1)
		}
	}
	if *tokenSerialNumber != "" {
		checkStringFlagNotEmpty("intermediate-profile", intermediateProfile)
		baseProfile = intermediateProfile
	}

	for {
		if *tokenSerialNumber != "" {
			// get intermediate session token with mfa, use that to assume role into target account
			ensureSessionTokenProfile(profile, intermediateProfile, tokenSerialNumber, intermediateDuration, region)
		}

		var sess *session.Session
		if *useInstanceProfile {
			sess = session.Must(session.NewSession())
		} else {
			sess = session.Must(session.NewSessionWithOptions(session.Options{
				Config:  aws.Config{Region: region},
				Profile: *baseProfile,}))
		}

		ensureTargetProfile(sess, targetProfile, &roleArn, targetDuration)

		if *exportProfile {
			checkStringFlagNotEmpty("export-file", exportFile)
			writeProfileToFile(*exportFile, *targetProfile)
		}

		if ! *renew {
			break
		}
		time.Sleep(time.Second * time.Duration(*targetDuration/2))
	}
}
