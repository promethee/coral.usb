#!/bin/sh
docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name $(basename "$PWD") $USER/$(basename "$PWD"):$(arch)
