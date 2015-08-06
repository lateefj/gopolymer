SHELL := /bin/bash

# This would be a nice discover plugin that would traverse the code base and vendor external packages
GO_DEPS = github.com/GeertJohan/go.rice github.com/GeertJohan/go.rice/rice github.com/Sirupsen/logrus

all: clean compile embed

clean:
	rm -rf bin

ui-deps:
	npm install -g bower
	npm install -g vulcanize # TODO figure out a way to get polymer to be packagable

ui-build:
	cd src/cmd/gopolyd/ui/ && bower install

deps:
	go get github.com/constabulary/gb/...
	go get github.com/GeertJohan/go.rice 

vendor-update:
	for dep in $(GO_DEPS) ; do \
		echo $$dep ; \
		gb vendor update $$dep ; \
	done

vendor: deps
	for dep in $(GO_DEPS) ; do \
		echo $$dep ; \
		gb vendor fetch $$dep ; \
	done

build: deps
	mkdir -p bin
	# Would be nice if gb would fix this with a crosscompile plugin?
	# Linux build
	#GOARCH=amd64 GOOS=linux gb build && mv bin/gopolyd bin/linux_gopolyd
	# OS X build
	#GOARCH=amd64 GOOS=darwin gb build && mv bin/gopolyd bin/darwin_gopolyd
	gb build

embed: build ui-build
	cd src/cmd/gopolyd/ && rice append --exec ../../../bin/gopolyd


# Crosscompile sadness :(
build-linux: deps
	cd src/cmd/gopolyd && env GOOS=linux go build -o ../../../bin/gopolyd

embed-linux: build-linux
	cd src/cmd/gopolyd/ && rice append --exec ../../../bin/gopolyd

