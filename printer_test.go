package main

// These tests are too simple.

import (
	"bytes"
	"github.com/stretchr/testify/assert"
	"testing"
)

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
