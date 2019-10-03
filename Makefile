.PHONY: all build clean test

BIN_DIR := build
BIN_NAME := swamp
CGO0_BINS := $(BIN_DIR)/$(BIN_NAME)-alpine-amd64 $(BIN_DIR)/$(BIN_NAME)-darwin-amd64 $(BIN_DIR)/$(BIN_NAME)-windows-amd64.exe $(BIN_DIR)/$(BIN_NAME)-windows-386.exe
CGO1_BINS := $(BIN_DIR)/$(BIN_NAME)-linux-amd64
LOCAL_BIN := $(BIN_DIR)/$(BIN_NAME)
BINS := $(CGO0_BINS) $(CGO1_BINS) $(LOCAL_BIN)
TARGET ?= $(HOME)/bin
VERSION=$(shell git describe --tags)

temp=$(subst -, ,$@)
os=$(subst alpine,linux,$(word 2, $(temp)))
arch=$(subst .exe,,$(word 3, $(temp)))

all: test build

build: $(BINS)

install: $(LOCAL_BIN)
	cp $(LOCAL_BIN) $(TARGET)/

clean:
	rm -rf $(BIN_DIR)

test:
	go test -v -cover ./...

$(CGO0_BINS):
	GOOS=$(os) GOARCH=$(arch) CGO_ENABLED=0 go build -o '$@' *.go

$(CGO1_BINS):
	GOOS=$(os) GOARCH=$(arch) CGO_ENABLED=1 go build -o '$@' *.go

$(LOCAL_BIN):
	go build -o '$@' *.go

fmt: *.go
	go fmt *.go
