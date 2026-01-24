#!/bin/sh

BASEDIR=/workspace/ComfyUI/

function download_from_file {
    FILE=$1
    OUTPUT_PATH=$2
    aria2c \
        --continue \
        --max-concurrent-downloads=16 \
        --split=16 \
        --max-connection-per-server=16 \
        --min-split-size=1M \
        --enable-http-pipelining=true \
        --disable-ipv6=true \
        --auto-file-renaming=false \
        --dir="$OUTPUT_PATH" \
        -i $FILE
}

