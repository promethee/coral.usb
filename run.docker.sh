#!/bin/sh
docker run -d --name $(basename "$PWD") $USER/$(basename "$PWD"):$(arch)
