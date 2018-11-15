package main

import (
	"fmt"
	"os"
	"os/user"
	"path"
	"path/filepath"
	"time"

	"github.com/aws/aws-sdk-go/service/sts"
	"github.com/go-ini/ini"
	"github.com/golang-utils/lockfile"
)

type ProfileWriter struct {
	lock            lockfile.LockFile
	awsPath         string
	credentialsPath string
	lockPath        string
}

func NewProfileWriter() (*ProfileWriter, error) {
	if credentialsPath, err := getCredentialsPath(); err != nil {
		return nil, err
	} else {
		awsPath, _ := path.Split(credentialsPath)
		return &ProfileWriter{
			lock:            lockfile.New(),
			awsPath:         awsPath,
			credentialsPath: credentialsPath,
			lockPath:        filepath.Join(os.TempDir(), "swamp.lock"),
		}, nil
	}
}

func getCredentialsPath() (string, error) {
	credentialsPath := os.Getenv("AWS_SHARED_CREDENTIALS_FILE")
	if credentialsPath == "" {
		usr, err := user.Current()
		if err != nil {
			return "", fmt.Errorf("Error fetching home dir: %s", err)
		}
		return filepath.Join(filepath.Join(usr.HomeDir, ".aws"), "credentials"), nil
	} else {
		return credentialsPath, nil
	}
}

func (pw *ProfileWriter) WriteProfile(cred *sts.Credentials, profileName, region *string) error {
	pw.acquire_lock()
	defer pw.release_lock()

	if cfg, err := pw.getOrCreateCredentialsFile(); err != nil {
		return err
	} else {
		if sec, err := pw.getOrCreateSection(cfg, profileName); err != nil {
			return err
		} else {
			if err := pw.writeSection(sec, cred, region); err != nil {
				return err
			}

			if err := cfg.SaveTo(pw.credentialsPath); err != nil {
				return fmt.Errorf("Error writing credentials file: %s", err)
			}
		}
	}

	printer.Printf("Wrote session token for profile %s\n", *profileName)
	printer.Printf("Token is valid until: %v\n", cred.Expiration)

	return nil
}

func (pw *ProfileWriter) acquire_lock() {
	for {
		if err := pw.lock.Lock(pw.lockPath); err == nil {
			return
		} else {
			fmt.Printf("Waiting for lock %s\n", pw.lockPath)
			time.Sleep(time.Second)
		}
	}
}

func (pw *ProfileWriter) release_lock() {
	os.Remove(pw.lockPath)
}

func (pw *ProfileWriter) getOrCreateCredentialsFile() (*ini.File, error) {
	if _, err := os.Stat(pw.awsPath); err != nil {
		if err := os.MkdirAll(pw.awsPath, os.ModePerm); err != nil {
			return nil, fmt.Errorf("Error creating aws config path %s: %s", pw.awsPath, err)
		}
	}

	cfg, err := ini.Load(pw.credentialsPath)
	if err != nil {
		fmt.Printf("Unable to find credentials file %s. Creating new file.\n", pw.credentialsPath)
		cfg = ini.Empty()
	}
	return cfg, nil
}

func (pw *ProfileWriter) getOrCreateSection(cfg *ini.File, profileName *string) (*ini.Section, error) {
	sec, err := cfg.GetSection(*profileName)
	if err != nil {
		if sec, err = cfg.NewSection(*profileName); err != nil {
			return nil, fmt.Errorf("Error creating new profile %s: %s", *profileName, err)
		}
	}
	return sec, err
}

func (pw *ProfileWriter) writeSection(sec *ini.Section, cred *sts.Credentials, region *string) error {
	if err := pw.writeKey(sec, "aws_access_key_id", cred.AccessKeyId); err != nil {
		return err
	}
	if err := pw.writeKey(sec, "aws_secret_access_key", cred.SecretAccessKey); err != nil {
		return err
	}
	if err := pw.writeKey(sec, "aws_session_token", cred.SessionToken); err != nil {
		return err
	}
	if region != nil && *region != "" {
		if err := pw.writeKey(sec, "region", region); err != nil {
			return err
		}
	}
	return nil
}

func (pw *ProfileWriter) writeKey(sec *ini.Section, name string, value *string) error {
	if key, err := sec.GetKey(name); err != nil {
		if _, err := sec.NewKey(name, *value); err != nil {
			return fmt.Errorf("Error writing config key %s: %s", name, err)
		}
	} else {
		key.SetValue(*value)
	}
	return nil
}
