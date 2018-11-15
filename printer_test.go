package main

// These tests are too simple.

import (
	"bytes"
	"github.com/stretchr/testify/assert"
	"os"
	"testing"
)

type tester struct {
	flag    int
	prefix  string
	pattern string // regexp that log output must match; we add ^ and expected_text$ always
}

// Test using Println("hello", 23, "world") or using Printf("hello %d world", 23)
func testPrint(t *testing.T, useFormat bool, off bool) {
	buf := new(bytes.Buffer)
	SetOutput(buf)
	SetOff(off)
	if useFormat {
		Printf("hello %d world", 23)
	} else {
		Println("hello", 23, "world")
	}
	line := buf.String()
	if len(line) > 0 { line = line[0 : len(line)-1] }
	SetOutput(os.Stdout)
	SetOff(false)
	if off {
		assert.Equal(t, "", buf.String())
	} else {
		assert.Equal(t, "hello 23 world\n", buf.String())
	}
}

func TestAll(t *testing.T) {
	testPrint(t,false,false)
	testPrint(t,true,false)
	testPrint(t,false,true)
	testPrint(t,true,true)
}

// Test using p.Println("hello", 23, "world") or using p.Printf("hello %d world", 23)
func testPPrint(t *testing.T, useFormat bool, off bool) {
	buf := new(bytes.Buffer)
	p := NewPrinter(buf)
	p.SetOff(off)
	if useFormat {
		p.Printf("hello %d world", 23)
	} else {
		p.Println("hello", 23, "world")
	}
	line := buf.String()
	if len(line) > 0 { line = line[0 : len(line)-1] }
	if off {
		assert.Equal(t, "", buf.String())
	} else {
		assert.Equal(t, "hello 23 world\n", buf.String())
	}
}

func TestPAll(t *testing.T) {
	testPPrint(t,false,false)
	testPPrint(t,true,false)
	testPPrint(t,false,true)
	testPPrint(t,true,true)
}
