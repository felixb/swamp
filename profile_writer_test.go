package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"os/user"
	"path"
	"path/filepath"
	"testing"

	"github.com/aws/aws-sdk-go/service/sts"
	"github.com/stretchr/testify/assert"
)

func TestProfileWriter_NewProfileWriterWithDefaults(t *testing.T) {
	pw, err := NewProfileWriter()
	assert.NoError(t, err)
	assert.NotNil(t, pw)

	usr, _ := user.Current()
	awsPath := filepath.Join(usr.HomeDir, ".aws")
	credPath := filepath.Join(awsPath, "credentials")

	assert.Equal(t, awsPath+"/", pw.awsPath)
	assert.Equal(t, credPath, pw.credentialsPath)
}

func TestProfileWriter_NewProfileWriterWithEnvironment(t *testing.T) {
	awsPath := "/tmp/foo/"
	credPath := "/tmp/foo/.aws-secrets"
	os.Setenv("AWS_SHARED_CREDENTIALS_FILE", credPath)
	defer os.Clearenv()

	pw, err := NewProfileWriter()
	assert.NoError(t, err)
	assert.NotNil(t, pw)

	assert.Equal(t, awsPath, pw.awsPath)
	assert.Equal(t, credPath, pw.credentialsPath)
}

func TestProfileWriter_WriteProfile(t *testing.T) {
	credPath := path.Join(os.TempDir(), "swamp-test.ini")
	os.Remove(credPath)

	os.Setenv("AWS_SHARED_CREDENTIALS_FILE", credPath)
	defer os.Clearenv()
	defer os.Remove(credPath)

	profileName := "some-profile"
	region := "some-region"
	creds := &sts.Credentials{}
	creds.SetAccessKeyId("some-access-key")
	creds.SetSecretAccessKey("some-secret-access-key")
	creds.SetSessionToken("some-session-token")
	quiet := false

	pw, _ := NewProfileWriter()
	pw.WriteProfile(creds, &profileName, &region, quiet)

	b, err := ioutil.ReadFile(credPath)
	assert.NoError(t, err)

	content := string(b)

	assert.Regexp(t, `^\[some-profile\]\n.*`, content)
	assertKeyValue(t, "region", "some-region", content)
	assertKeyValue(t, "aws_access_key_id", "some-access-key", content)
	assertKeyValue(t, "aws_secret_access_key", "some-secret-access-key", content)
	assertKeyValue(t, "aws_session_token", "some-session-token", content)
}

func TestProfileWriter_WriteProfileWoRegion(t *testing.T) {
	credPath := path.Join(os.TempDir(), "swamp-test.ini")
	os.Remove(credPath)

	os.Setenv("AWS_SHARED_CREDENTIALS_FILE", credPath)
	defer os.Clearenv()
	defer os.Remove(credPath)

	profileName := "some-profile"
	region := ""
	creds := &sts.Credentials{}
	creds.SetAccessKeyId("some-access-key")
	creds.SetSecretAccessKey("some-secret-access-key")
	creds.SetSessionToken("some-session-token")
	quiet := true

	pw, _ := NewProfileWriter()
	pw.WriteProfile(creds, &profileName, &region, quiet)

	b, err := ioutil.ReadFile(credPath)
	assert.NoError(t, err)

	content := string(b)

	assert.Regexp(t, `^\[some-profile\]\n.*`, content)
	assert.NotRegexp(t, `region`, content)
	assertKeyValue(t, "aws_access_key_id", "some-access-key", content)
	assertKeyValue(t, "aws_secret_access_key", "some-secret-access-key", content)
	assertKeyValue(t, "aws_session_token", "some-session-token", content)
}

func TestProfileWriter_NothingGoesToStdout(t *testing.T) {
	credPath := path.Join(os.TempDir(), "swamp-test.ini")
	os.Remove(credPath)
	os.OpenFile(credPath, os.O_RDONLY|os.O_CREATE, 0666)

	os.Setenv("AWS_SHARED_CREDENTIALS_FILE", credPath)
	defer os.Clearenv()
	defer os.Remove(credPath)

	profileName := "some-profile"
	region := "some-region"
	creds := &sts.Credentials{}
	creds.SetAccessKeyId("some-access-key")
	creds.SetSecretAccessKey("some-secret-access-key")
	creds.SetSessionToken("some-session-token")
	quiet := true
	pw, _ := NewProfileWriter()

	rescueStdout := os.Stdout
	r, w, _ := os.Pipe()
	os.Stdout = w

	pw.WriteProfile(creds, &profileName, &region, quiet)

	w.Close()
	out, _ := ioutil.ReadAll(r)
	os.Stdout = rescueStdout
	assert.Equal(t, []byte{}, out)

	_, err := ioutil.ReadFile(credPath)
	assert.NoError(t, err)
}

func assertKeyValue(t *testing.T, key, value, content string) {
	assert.Regexp(t, fmt.Sprintf(`\n%s\s*=\s*%s\n.*`, key, value), content)
}

