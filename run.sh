#!/bin/bash

screen -L -Logfile run.log \
       docker run --rm \
       --name drbl \
       --privileged \
       --net=host \
       --tmpfs /tmp:exec \
       --tmpfs /run \
       -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
       andzuc/debian-drbl:latest
