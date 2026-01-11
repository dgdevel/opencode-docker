#!/usr/bin/env sh
ID=$(docker ps --format json | jshon -e ID -u)

docker exec -i -t $ID /bin/bash

