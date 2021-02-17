package main

import (
	"bytes"
	"github.com/stretchr/testify/assert"
	"io"
	"io/ioutil"
	"testing"
)

func TestAliases_Generate(t *testing.T) {
	r, w := io.Pipe()

	go func() {
		generateAliases(w, "example/config.yaml")
		w.Close()
	}()

	expected, e := ioutil.ReadFile("example/bash_aliases.sh")
	assert.NoError(t, e)
	expectedString := string(expected)

	buf := new(bytes.Buffer)
	_, e = buf.ReadFrom(r)
	assert.NoError(t, e)
	actualString := buf.String()

	assert.Equal(t, len(expected), len(actualString))
	assert.Equal(t, expectedString, actualString)
}
