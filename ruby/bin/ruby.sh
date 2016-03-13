#!/bin/bash

bin/build.sh

docker run ruby ruby $*
