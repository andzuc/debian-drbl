#!/bin/bash

export LAST_SERVER_COMMIT=`git ls-remote . "refs/heads/master"`
tar -C context -cf - . \
    |docker build \
	    --progress=plain \
	    --build-arg LAST_SERVER_COMMIT="$LAST_SERVER_COMMIT" \
	    -t andzuc/debian-drbl \
	    - \
	    2>&1 \
    |tee build.log
