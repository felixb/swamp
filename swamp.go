package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"os/user"
	"path/filepath"
	"strings"
	"time"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/sts"
	"github.com/go-ini/ini"
	"github.com/golang-utils/lockfile"
)

func die(msg string, err error) {
	fmt.Fprintf(os.Stderr, msg + ": %v\n", err)
	os.Exit(1)
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
	credentialsPath := filepath.Join(awsPath, "credentials")
	lockPath := filepath.Join(awsPath, ".credentials.lock")

	// get a lock to prevent concurrent writes on credentials file
	lock := lockfile.New()
	for {
		if err := lock.Lock(lockPath); err == nil {
			break
		} else {
			fmt.Printf("Waiting for lock %s\n", lockPath)
			time.Sleep(time.Second)
		}
	}

	cfg, err := ini.Load(credentialsPath)
	if err != nil {
		fmt.Printf("Unable to find credentials file %s. Creating new file.\n", credentialsPath)

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

	if err := cfg.SaveTo(credentialsPath); err != nil {
		die("Error writing credentials file", err)
	}

	// release the lock manually
	os.Remove(lockPath)

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

func getTokenCode(tokenSerialNumber string) *string {
	if tokenSerialNumber == "" {
		return nil
	}

	reader := bufio.NewReader(os.Stdin)
	fmt.Printf("Enter mfa token for %s: ", tokenSerialNumber)
	if tokenCode, err := reader.ReadString('\n'); err != nil {
		die("Error reading mfa token", err)
		return nil
	} else {
		tokenCode = strings.Trim(tokenCode, " \r\n")
		return &tokenCode
	}
}

func validateSessionToken(options session.Options) bool {
	sess := session.Must(session.NewSessionWithOptions(options))
	svc := sts.New(sess)
	_, err := svc.GetCallerIdentity(&sts.GetCallerIdentityInput{})
	return err == nil
}

func getSessionToken(options session.Options, config *SwampConfig) *sts.Credentials {
	sess := session.Must(session.NewSessionWithOptions(options))
	svc := sts.New(sess)
	output, err := svc.GetSessionToken(&sts.GetSessionTokenInput{
		DurationSeconds: &config.intermediateDuration,
		SerialNumber:    &config.tokenSerialNumber,
		TokenCode:       getTokenCode(config.tokenSerialNumber),
	})
	if err != nil {
		die("Error getting session token", err)
	}

	return output.Credentials
}

// validate session token and request a new one if it's invalid.
// write target profile into .aws/credentials
func ensureSessionTokenProfile(config *SwampConfig) {
	if validateSessionToken(session.Options{
		Config:  aws.Config{Region: &config.region},
		Profile: config.intermediateProfile,
	}) {
		fmt.Printf("Session token for profile %s is still valid\n", config.profile)
	} else {
		cred := getSessionToken(session.Options{
			Config:  aws.Config{Region: &config.region},
			Profile: config.profile,
		}, config)
		writeProfile(cred, &config.intermediateProfile, &config.region)
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
func ensureTargetProfile(sess *session.Session, config *SwampConfig) {
	svc := sts.New(sess)

	userId := getCallerId(svc).Arn
	parts := strings.Split(*userId, "/")
	roleSessionName := parts[len(parts) - 1]

	cred := assumeRole(svc, config.GetRoleArn(), &roleSessionName, &config.targetDuration)
	writeProfile(cred, &config.targetProfile, sess.Config.Region)
}

func writeProfileToFile(config *SwampConfig) {
	file, err := os.Create(config.exportFile)
	if err != nil {
		die("Error writing target profile to export file", err)
	}
	defer file.Close()

	fmt.Fprintf(file, "export AWS_PROFILE=%s\nunset AWS_ACCESS_KEY_ID\nunset AWS_SECRET_ACCESS_KEY\n", config.targetProfile)
}

func main() {
	// set up command line flags
	config := NewSwampConfig()
	config.SetupFlags()
	flag.Parse()

	// check user input on command line flags
	baseProfile := &config.profile
	config.Validate()

	if config.tokenSerialNumber != "" {
		baseProfile = &config.intermediateProfile
	}

	for {
		if config.tokenSerialNumber != "" {
			// get intermediate session token with mfa, use that to assume role into target account
			ensureSessionTokenProfile(config)
		}

		var sess *session.Session
		if config.useInstanceProfile {
			sess = session.Must(session.NewSession())
		} else {
			sess = session.Must(session.NewSessionWithOptions(session.Options{
				Config:  aws.Config{Region: &config.region},
				Profile: *baseProfile, }))
		}

		ensureTargetProfile(sess, config)

		if config.exportProfile {
			writeProfileToFile(config)
		}

		if !config.renew {
			break
		}
		time.Sleep(time.Second * time.Duration(config.targetDuration / 2))
	}
}
