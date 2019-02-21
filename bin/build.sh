#!/usr/bin/env bash
set -ex
export GOBIN=$GOPATH/bin
go get
go test
make
