#!/bin/bash
export LIBGL_ALWAYS_INDIRECT=0
export LIBGL_ALWAYS_SOFTWARE=1
export MESA_GL_VERSION_OVERRIDE=3.0
#PROFILEDIR="${HOME}/dev/scilab"

docker run --rm -it --net=host\
       --env="DISPLAY" \
       --env="LIBGL_ALWAYS_INDIRECT" \
       --env="LIBGL_ALWAYS_SOFTWARE" \
       --env="MESA_GL_VERSION_OVERRIDE" \
       --mount "type=bind,src=${HOME}/.Xauthority,dst=/home/scilab/.Xauthority,readonly" \
       --entrypoint /bin/bash \
       andzuc/debian-drbl:latest
