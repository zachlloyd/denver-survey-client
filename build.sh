#!/bin/bash
#
# Builds the Warp client survey tar archives for release

VERSION=0.2.1

set -e -x

echo 'Building 64-bit mac binary'
mkdir -p build/mac
env GOOS=darwin GOARCH=amd64 go build -o build/mac/dsurvey github.com/warpdotdev/warp-cli-survey/cli
cd build/mac && tar -zcvf dsurvey.$VERSION.mac.x86_64.tar.gz dsurvey && cd -

mkdir -p build/linux
echo 'Building 64-bit linux binary'
env GOOS=linux GOARCH=amd64 go build -o build/linux/dsurvey github.com/warpdotdev/warp-cli-survey/cli
cd build/linux && tar -zcvf dsurvey.$VERSION.linux.x86_64.tar.gz dsurvey && cd -

set +x