#!/bin/sh
# Clone local ComfyUI -> VastAI Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/clone_local.sh)


BASEDIR=/workspace/ComfyUI

#install aria2 for faster downloads
apt-get update && apt-get install -y aria2

mkdir -p $BASEDIR/YT/cloner
cd $BASEDIR/YT/cloner

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

#dowload custom nodes
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/custom_nodes/custom_nodes.txt

cat $BASEDIR/YT/cloner/custom_nodes.txt | while read line; do
    cd $BASEDIR/custom_nodes
    echo ">> Cloning $line"
    git clone $line
    cd -
done

#dowload workflows
#mkdir -p $BASEDIR/workflows
#cd $BASEDIR/workflows
#wget https://github.com/Youtensils/vast.ai/raw/refs/heads/main/scripts/clone_instance/workflows/workflows.tgz
#tar -xvzf workflows.tgz
#cd -

#download audio_encoders
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/audio_encoders.txt
#download_from_file $BASEDIR/YT/cloner/audio_encoders.txt $BASEDIR/models/audio_encoders

#download checkpoints
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/checkpoints.txt
#download_from_file $BASEDIR/YT/cloner/checkpoints.txt $BASEDIR/models/checkpoints

#download clips
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/clips.txt
#download_from_file $BASEDIR/YT/cloner/clips.txt $BASEDIR/models/clips

#download clip_vision
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/clip_vision.txt
download_from_file $BASEDIR/YT/cloner/clip_vision.txt $BASEDIR/models/clip_vision

#download controlnet
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/controlnet.txt
#download_from_file $BASEDIR/YT/cloner/controlnet.txt $BASEDIR/models/controlnet

#download detection
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/detection.txt
#download_from_file $BASEDIR/YT/cloner/detection.txt $BASEDIR/models/detection

#download diffusers
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/diffusers.txt
#download_from_file $BASEDIR/YT/cloner/diffusers.txt $BASEDIR/models/diffusers

#download diffusion_models
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/diffusion_models.txt
download_from_file $BASEDIR/YT/cloner/diffusion_models.txt $BASEDIR/models/diffusion_models

#download embeddings
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/embeddings.txt
#download_from_file $BASEDIR/YT/cloner/embeddings.txt $BASEDIR/models/embeddings

#download gligen
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/gligen.txt
#download_from_file $BASEDIR/YT/cloner/gligen.txt $BASEDIR/models/gligen

#download latent_upscale_models
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/latent_upscale_models.txt
#download_from_file $BASEDIR/YT/cloner/latent_upscale_models.txt $BASEDIR/models/latent_upscale_models

#download loras
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/loras.txt
download_from_file $BASEDIR/YT/cloner/loras.txt $BASEDIR/models/loras

#download model_patches
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/model_patches.txt
#download_from_file $BASEDIR/YT/cloner/model_patches.txt $BASEDIR/models/model_patches

#download sam2
#wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/sam2.txt
#download_from_file $BASEDIR/YT/cloner/sam2.txt $BASEDIR/models/sam2

#download text_encoders
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/text_encoders.txt
download_from_file $BASEDIR/YT/cloner/text_encoders.txt $BASEDIR/models/text_encoders

#download vaes
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/models/vae.txt
download_from_file $BASEDIR/YT/cloner/vae.txt $BASEDIR/models/vae
