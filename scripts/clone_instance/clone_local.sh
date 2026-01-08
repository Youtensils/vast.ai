#!/bin/sh
# Clone local ComfyUI -> VastAI Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/clone_local.sh)

BASEDIR=/workspace/ComfyUI

#install aria2 for faster downloads
apt-get update && apt-get install -y aria2

mkdir -p $BASEDIR/YT/cloner
cd $BASEDIR/YT/cloner

function download_from_file() {
    FILE=$1
    OUTPUT_PATH=$2
    grep -v '^\s*#' $FILE | aria2c \
        --continue \
        --max-concurrent-downloads=16 \
        --split=16 \
        --max-connection-per-server=16 \
        --min-split-size=1M \
        --enable-http-pipelining=true \
        --disable-ipv6=true \
        --dir="$OUTPUT_PATH" \
        -i -

}




#dowload custom nodes
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/custom_nodes.txt

cat $BASEDIR/YT/cloner/custom_nodes.txt | while read line; do
    cd $BASEDIR/custom_nodes
    echo ">> Cloning $line"
    git clone $line
    cd -
done

#download vaes
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/vae.txt
download_from_file $BASEDIR/YT/cloner/vae.txt $BASEDIR/models/vae


