#!/bin/bash

docker run --rm -it \
       --name drbl \
       --net=host \
       --entrypoint /bin/bash \
       andzuc/debian-drbl:latest
