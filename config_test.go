package main

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestSwampConfig_ValidateSessionProfileOnly(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = ""
	c.targetRole = ""
	c.targetProfile = ""
	c.tokenSerialNumber = "someSerialNumber"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateSessionProfileOnlyMissingMfaDevice(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = ""
	c.targetRole = ""
	c.targetProfile = ""
	c.tokenSerialNumber = ""

	assert.Error(t, c.Validate())
}

func TestSwampConfig_ValidateAccountAndRoleName(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = "1234567890"
	c.targetRole = "some-role"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateRoleArn(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = ""
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateAccountAndRoleArn(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = "1234567890"
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"

	assert.Error(t, c.Validate())
}

func TestSwampConfig_NotDefaults(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = "1234567890"
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"
	c.aliasConfig = "CHANGELOG.md"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateMFADeviceAndTokenCommand(t *testing.T) {
	c := NewSwampConfig()
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"
	c.tokenSerialNumber = "someSerialNumber"
	c.mfaExec = "some command"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateNoMFADeviceButTokenCommand(t *testing.T) {
	c := NewSwampConfig()
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"
	c.mfaExec = "some command"

	assert.Error(t, c.Validate())
}

func TestSwampConfig_GetRoleArnWithArn(t *testing.T) {
	c := NewSwampConfig()
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"
	c.targetAccount = "does-not-matter-at-all"

	arn := c.GetRoleArn()
	assert.Equal(t, *arn, "arn:aws:iam::1234567890:role/some-role")
}

func TestSwampConfig_GetRoleArnWithAccountAndRole(t *testing.T) {
	c := NewSwampConfig()
	c.targetRole = "some-role"
	c.targetAccount = "1234567890"

	arn := c.GetRoleArn()
	assert.Equal(t, *arn, "arn:aws:iam::1234567890:role/some-role")
}

func TestSwampConfig_DefaultQuietIsFalse(t *testing.T) {
	c := NewSwampConfig()
	c.targetRole = "some-role"
	c.targetAccount = "1234567890"

	assert.Equal(t, false, c.quiet)
}

func TestSwampConfig_Aliases(t *testing.T) {
	c := NewSwampConfig()
	c.aliasConfig = "does-not-exists"

	assert.Error(t, c.Validate())
}
func TestSwampConfig_AliasesMissing(t *testing.T) {
	c := NewSwampConfig()
	c.aliasConfig = "CHANGELOG.md"

	assert.NoError(t, c.Validate())
}
