#!/bin/bash

BASEDIR=/workspace/runpod-slim/ComfyUI/
source $BASEDIR/YT/runpod/scripts/instance/env.sh

echo "> Downloading models from $1"

download_from_file $1 $BASEDIR/models
