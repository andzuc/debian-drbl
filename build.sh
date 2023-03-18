#!/bin/bash

tar -C context -cf - . \
    |docker build \
	    --progress=plain \
	    --platform linux/386 \
	    -t andzuc/debian-drbl \
	    -
