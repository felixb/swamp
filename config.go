package main

import (
	"errors"
	"flag"
	"fmt"
	"os"
	"runtime"
	"strings"
)

const (
	INTERMEDIATE_SESSION_TOKEN_DURATION = int64(12 * 60 * 60)
	TARGET_SESSION_TOKEN_DURATION       = int64(60 * 60)
	VERSION                             = "0.13.0"
)

type SwampConfig struct {
	aliasConfig          string
	targetAccount        string
	intermediateProfile  string
	intermediateDuration int64
	targetProfile        string
	targetRole           string
	targetDuration       int64
	profile              string
	region               string
	tokenSerialNumber    string
	useInstanceProfile   bool
	renew                bool
	exec                 string
	mfaExec              string
	quiet                bool
}

func NewSwampConfig() *SwampConfig {
	return &SwampConfig{
		aliasConfig:          "",
		targetAccount:        "",
		intermediateProfile:  "session-token",
		intermediateDuration: INTERMEDIATE_SESSION_TOKEN_DURATION,
		targetProfile:        "swamp",
		targetRole:           "",
		targetDuration:       TARGET_SESSION_TOKEN_DURATION,
		profile:              "",
		region:               "",
		tokenSerialNumber:    "",
		renew:                false,
		exec:                 "",
		mfaExec:              "",
		quiet:                false,
	}
}

func (config *SwampConfig) isRoleArn() bool {
	return strings.HasPrefix(config.targetRole, "arn:aws:iam::")
}

func (config *SwampConfig) GetRoleArn() *string {
	if config.isRoleArn() {
		return &config.targetRole
	} else {
		arn := fmt.Sprintf("arn:aws:iam::%s:role/%s", config.targetAccount, config.targetRole)
		return &arn
	}
}

func (config *SwampConfig) SetupFlags() {
	flag.StringVar(&config.targetAccount, "account", config.targetAccount, "AWS account")
	flag.StringVar(&config.intermediateProfile, "intermediate-profile", config.intermediateProfile, "Intermediate AWS CLI profile")
	flag.Int64Var(&config.intermediateDuration, "intermediate-duration", config.intermediateDuration, "Token duration in seconds for intermediate profile")
	flag.StringVar(&config.targetProfile, "target-profile", config.targetProfile, "Write this AWS CLI profile")
	flag.StringVar(&config.targetRole, "target-role", config.targetRole, "AWS role to assume (can either be ARN or name)")
	flag.Int64Var(&config.targetDuration, "target-duration", config.targetDuration, "Token duration in seconds for target profile")
	flag.StringVar(&config.profile, "profile", config.profile, "AWS CLI profile")
	flag.StringVar(&config.region, "region", config.region, "AWS region")
	flag.StringVar(&config.tokenSerialNumber, "mfa-device", config.tokenSerialNumber, "MFA device arn")
	flag.BoolVar(&config.renew, "renew", config.renew, "Renew token every duration/2")
	flag.BoolVar(&config.quiet, "quiet", config.quiet, "Suppress output")
	if runtime.GOOS == "linux" || runtime.GOOS == "darwin" {
		// platform specific flags
		flag.StringVar(&config.aliasConfig, "alias-config", config.aliasConfig, "Generate aliases from yaml `file`")
		flag.StringVar(&config.exec, "exec", config.exec, "Execute this commend with AWS_PROFILE set to target protile")
		flag.StringVar(&config.mfaExec, "mfa-exec", config.mfaExec, "Executable command for obtaining mfa-device token")
	}
	flag.Usage = flagUsage
}

func (config *SwampConfig) validateDefaultFlags() error {
	if config.targetRole != "" || config.tokenSerialNumber == "" {
		if err := checkStringFlagNotEmpty("target-profile", config.targetProfile); err != nil {
			return err
		}
		if !config.isRoleArn() {
			if err := checkStringFlagNotEmpty("account", config.targetAccount); err != nil {
				return err
			}
		} else {
			if config.targetAccount != "" {
				return errors.New("Target role in ARN format and target account are mutual exclusive")
			}
		}
	}

	if config.tokenSerialNumber != "" {
		if err := checkStringFlagNotEmpty("intermediate-profile", config.intermediateProfile); err != nil {
			return err
		}
	}

	if config.mfaExec != "" {
		if err := checkStringFlagNotEmpty("mfa-device", config.tokenSerialNumber); err != nil {
			return err
		}
	}

	return nil
}

func (config *SwampConfig) validateAliasFlags() error {
	if _, err := os.Stat(config.aliasConfig); os.IsNotExist(err) {
		return err
	}
	return nil
}

func (config *SwampConfig) Validate() error {
	if config.aliasConfig == "" {
		return config.validateDefaultFlags()
	} else {
		return config.validateAliasFlags()
	}
}

func checkStringFlagNotEmpty(name string, f string) error {
	if f == "" {
		return fmt.Errorf("Missing mandatory parameter: %s", name)
	}
	return nil
}

func flagUsage() {
	fmt.Fprintf(os.Stderr, "Version of %s: %s\n", os.Args[0], VERSION)
	fmt.Fprintf(os.Stderr, "Usage of %s:\n", os.Args[0])
	flag.PrintDefaults()
}
