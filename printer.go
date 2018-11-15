package main

import (
	"fmt"
	"io"
	"os"
	"sync"
)

// A Printer represents an active printer object that generates lines of
// output to an io.Writer. Each output operation makes a single call to
// the Writer's Write method. A Printer can be used simultaneously from
// multiple goroutines; it guarantees to serialize access to the Writer.
type Printer struct {
	mu     sync.Mutex // ensures atomic writes; protects the following fields
	out    io.Writer  // destination for output
	buf    []byte     // for accumulating text to write
	off    bool       // should we be quiet?
}

// New creates a new Printer. The out variable sets the
// destination to which log data will be written.
func NewPrinter(out io.Writer) *Printer {
	return &Printer{out: out}
}

// Default printer.
var printer = NewPrinter(os.Stdout)

// SetOutput sets the output destination for the printer.
func (p *Printer) SetOutput(w io.Writer) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.out = w
}

// Output writes to the output destination. A newline is appended
// if the last character of s is not already a newline.
func (p *Printer) Output(s string) error {
	if p.off { return nil }
	p.mu.Lock()
	defer p.mu.Unlock()
	p.buf = p.buf[:0]
	p.buf = append(p.buf, s...)
	if len(s) == 0 || s[len(s)-1] != '\n' {
		p.buf = append(p.buf, '\n')
	}
	_, err := p.out.Write(p.buf)
	return err
}

// Printf calls p.Output to print to the printer.
// Arguments are handled in the manner of fmt.Printf.
func (p *Printer) Printf(format string, v ...interface{}) {
	p.Output(fmt.Sprintf(format, v...))
}

// Println calls p.Output to print to the printer.
// Arguments are handled in the manner of fmt.Println.
func (p *Printer) Println(v ...interface{}) { p.Output(fmt.Sprintln(v...)) }

// Set quiet mode.
func (p *Printer) SetOff(off bool) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.off = off
}

// The following functions use the standard printer.

// SetOutput sets the output destination for the standard printer.
func SetOutput(w io.Writer) { printer.SetOutput(w) }

// Printf prints to the standard printer.
// Arguments are handled in the manner of fmt.Printf. A newline is
// appended if the last character of s is not already a newline.
func Printf(format string, v ...interface{}) { printer.Printf(format, v...) }

// Println prints to the standard printer.
// Arguments are handled in the manner of fmt.Println. A newline is
// appended if the last character of s is not already a newline.
func Println(v ...interface{}) { printer.Println(v...) }

// Output writes the output to the standard printer. A newline is
// appended if the last character of s is not already a newline.
func Output(s string) error { return printer.Output(s) }

// Set quiet mode to the standard printer.
func SetOff(off bool) { printer.SetOff(off) }
