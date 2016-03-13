#!/bin/bash

bin/build.sh

docker run -it ruby irb $*
