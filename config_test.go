package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

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