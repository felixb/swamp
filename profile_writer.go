package main

import (
	"fmt"
	"os"
	"os/user"
	"path/filepath"
	"time"

	"github.com/aws/aws-sdk-go/service/sts"
	"github.com/go-ini/ini"
	"github.com/golang-utils/lockfile"
)

type ProfileWriter struct {
	lock lockfile.LockFile
	awsPath string
	credentialsPath string
	lockPath string
}

func NewProfileWriter() *ProfileWriter {
	usr, err := user.Current()
	if err != nil {
		die("Error fetching home dir", err)
	}

	awsPath := filepath.Join(usr.HomeDir, ".aws")
	credentialsPath := filepath.Join(awsPath, "credentials")
	lockPath := filepath.Join(awsPath, ".credentials.lock")

	return &ProfileWriter{
		lock: lockfile.New(),
		awsPath: awsPath,
		credentialsPath: credentialsPath,
		lockPath: lockPath,
	}
}

func (pw *ProfileWriter) accuire_lock() {
	for {
		if err := pw.lock.Lock(pw.lockPath); err == nil {
			break
		} else {
			fmt.Printf("Waiting for lock %s\n", pw.lockPath)
			time.Sleep(time.Second)
		}
	}
}

func (pw *ProfileWriter) release_lock() {
	os.Remove(pw.lockPath)
}

func (pw *ProfileWriter) writeProfile(cred *sts.Credentials, targetProfile, region *string) {
	pw.accuire_lock()

	cfg, err := ini.Load(pw.credentialsPath)
	if err != nil {
		fmt.Printf("Unable to find credentials file %s. Creating new file.\n", pw.credentialsPath)

		if err := os.MkdirAll(pw.awsPath, os.ModePerm); err != nil { // TODO move to init
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

	if err := cfg.SaveTo(pw.credentialsPath); err != nil {
		die("Error writing credentials file", err)
	}

	pw.release_lock()

	fmt.Printf("Wrote session token for profile %s\n", *targetProfile)
	fmt.Printf("Token is valid until: %v\n", cred.Expiration)
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