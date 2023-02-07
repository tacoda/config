#!/usr/bin/env bash

# $1 == 'python'
# $2 == destination

DESTINATION=$2

cp docker/python.dockerfile $DESTINATION/Dockerfile
cp make/docker.make $DESTINATION/Makefile
(cd $DESTINATION && make build)

