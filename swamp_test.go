package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSwamp_ExecutingMFACommand(t *testing.T) {
	tokenCode := fetchTokenCode("someDeviceId", "echo 123456")

	assert.EqualValues(t, "123456", tokenCode)
}

func TestSwamp_ExecutingMFACommandTrimNewLine(t *testing.T) {
	tokenCode := fetchTokenCode("someDeviceId", "echo 123456\n")

	assert.EqualValues(t, "123456", tokenCode)
}

func TestSwamp_ExecutingMFACommandTrimTooLongInput(t *testing.T) {
	tokenCode := fetchTokenCode("someDeviceId", "echo 1234567")

	assert.EqualValues(t, "123456", tokenCode)
}
