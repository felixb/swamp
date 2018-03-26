package main

import (
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSwamp_ExecutingMFACommand(t *testing.T) {
	tokenCode := fetchTokenCode("some-device-id", "echo 1234")

	assert.EqualValues(t, "1234\n", tokenCode)
}

func TestSwamp_GetTokenCodeWithMFACommandTrimNewLine(t *testing.T) {
	config := NewSwampConfig()
	config.tokenSerialNumber = "some-device-id"
	config.mfaExec = "echo 123456\n"

	tokenCode := getTokenCode(config)

	assert.EqualValues(t, "123456", tokenCode)
}

func TestSwamp_ExecCommand_ExitCode_Zero(t *testing.T) {
	config := NewSwampConfig()
	config.exec = "true"

	err := execCommand(config)

	assert.NoError(t, err)
}

func TestSwamp_ExecCommand_ExitCode_NonZero(t *testing.T) {
	config := NewSwampConfig()
	config.exec = "false"

	err := execCommand(config)

	assert.Error(t, err)
}

func TestSwamp_ExecCommand_ExitCode_EnvironmentHasNotAwsCredentials(t *testing.T) {
	os.Setenv("AWS_ACCESS_KEY_ID", "some-access-key-id")
	os.Setenv("AWS_SECRET_ACCESS_KEY", "some-secret-access-key")
	os.Setenv("AWS_SESSION_TOKEN", "some-session-token")

	config := NewSwampConfig()
	config.targetProfile = "some-target-profile"
	config.exec = `test -z "${AWS_ACCESS_KEY_ID}" && test -z "${AWS_SECRET_ACCESS_KEY}" && test -z "${AWS_SESSION_TOKEN}"`

	err := execCommand(config)

	assert.NoError(t, err)
}
