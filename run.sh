#!/bin/bash

docker run --rm \
       --name drbl \
       --privileged \
       --net=host \
       andzuc/debian-drbl:latest
