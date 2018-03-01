.PHONY: build clean

VERSION=$(shell git describe --tags)

build: swamp_amd64 swamp_alpine swamp_darwin swamp.exe

.get-deps: *.go
	go get -t -d -v ./...
	touch .get-deps

clean:
	rm -f .get-deps
	rm -f *_amd64 *_darwin *.exe

swamp_amd64: .get-deps *.go
	 GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -o $@ *.go

swamp_alpine: .get-deps *.go
	 GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o $@ *.go

swamp_darwin: .get-deps *.go
	GOOS=darwin go build -o $@ *.go

swamp.exe: .get-deps *.go
	GOOS=windows GOARCH=amd64 go build -o $@ *.go
