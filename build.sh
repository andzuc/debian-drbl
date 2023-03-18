#!/bin/bash

tar -C context -cf - . \
    |docker build \
	    --progress=plain \
	    -t andzuc/debian-drbl \
	    -
