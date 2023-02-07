#!/usr/bin/env bash

# $1 == 'rails'
# $2 == destination

DESTINATION=$2

cp docker/rails.dockerfile $DESTINATION/Dockerfile
cp docker/rails.docker-compose.yml $DESTINATION/docker-compose.yml
cp docker/rails.entrypoint.sh $DESTINATION/entrypoint.sh
cp make/docker.make $DESTINATION/Makefile
(cd $DESTINATION && make build)

