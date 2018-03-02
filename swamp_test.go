package main

import (
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
