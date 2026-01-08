#!/bin/sh
# Clone local ComfyUI -> VastAI Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/clone_local.sh) 

BASEDIR=/workspace/ComfyUI/

#install aria2 for faster downloads
apt-get update && apt-get install -y aria2


mkdir -p $BASEDIR/YT/cloner
cd $BASEDIR/YT/cloner

#download listing file
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/listing.txt
#download Manager custom_nodes catalog
wget https://raw.githubusercontent.com/Comfy-Org/ComfyUI-Manager/refs/heads/main/custom-node-list.json


#dowload custom nodes
cat listing.txt | grep custom_nodes | cut -d "/" -f5 | sort | uniq | grep -v pycache | grep -v websocket_image > custom-nodes_required.txt


cat $BASEDIR/YT/cloner/custom-nodes_required.txt | while read line; do
    node_url=$(cat custom-node-list.json | grep cg-use-everywhere | grep -v reference | cut -d "\"" -f0).git
    cd $BASEDIR/ComfyUI/custom_nodes/
    git clone $node_url
    cd -
done



