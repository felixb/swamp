.PHONY: build clean

VERSION=$(shell git rev-parse HEAD)

build: swamp_amd64 swamp_darwin

.get-deps: *.go
	go get -t -d -v ./...
	touch .get-deps

clean:
	rm -f .get-deps
	rm -f *_amd64 *_darwin

swamp_amd64: .get-deps *.go
	 GOOS=linux GOARCH=amd64 go build -ldflags "-X main.version=$(VERSION)" -o $@ *.go

swamp_darwin: .get-deps *.go
	GOOS=darwin go build -ldflags "-X main.version=$(VERSION)" -o $@ *.go
