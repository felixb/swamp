#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$0")"
cd ${SCRIPT_DIR}/..

echo "Executing cross compile builds in docker"
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.11 bash bin/build.sh
