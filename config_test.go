package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSwampConfig_ValidateAccount(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = "1234567890"
	c.targetRole = "some-role"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateRole(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = ""
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"

	assert.NoError(t, c.Validate())
}

func TestSwampConfig_ValidateRoleAndAccount(t *testing.T) {
	c := NewSwampConfig()
	c.targetAccount = "1234567890"
	c.targetRole = "arn:aws:iam::1234567890:role/some-role"

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