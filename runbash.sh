#!/bin/bash

docker run --rm -it \
       --net=host \
       --entrypoint /bin/bash \
       andzuc/debian-drbl:latest
