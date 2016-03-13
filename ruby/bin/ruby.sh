#!/bin/bash

bin/build.sh

docker run \
  --rm \
  -v "$PWD":/app \
  -w /app \
  ruby \
  ruby $*
