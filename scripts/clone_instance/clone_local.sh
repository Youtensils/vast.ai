#!/bin/sh
# Clone local ComfyUI -> VastAI Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/clone_local.sh)

BASEDIR=/workspace/ComfyUI

#install aria2 for faster downloads
apt-get update && apt-get install -y aria2

mkdir -p $BASEDIR/YT/cloner
cd $BASEDIR/YT/cloner

#download listing file
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/custom_nodes.txt

#dowload custom nodes

cat $BASEDIR/YT/cloner/custom_nodes.txt | while read line; do
    cd $BASEDIR/custom_nodes
    echo ">> Cloning $line"
    git clone $line
    cd -
done

