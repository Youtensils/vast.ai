#!/bin/sh
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/runpod/refs/heads/main/scripts/instance/base_install.sh)


BASEDIR=/workspace/ComfyUI/

#install aria2 for faster downloads
apt-get update 
apt-get install -y aria2 
apt-get install -y screen 

mkdir -p $BASEDIR/YT/
cd $BASEDIR/YT/

if [ ! -d "runpod" ]; then
    echo "Cloning runpod repository..."
    git clone https://github.com/Youtensils/runpod.git
else
    echo "Runpod repository already exists. Pulling latest changes..."
    cd runpod
    git pull origin main
    cd ..
fi  

# Make all .sh scripts executable
find . | grep sh$ | while read script; do
    echo "Making $script executable..."
    chmod +x "$script"
done

alias gotoYT="cd $BASEDIR/YT/runpod"

# Install PyTorch Nightly for CUDA 12.9
# 1) remove old torch stack
pip uninstall -y torch torchvision torchaudio
pip cache purge

# 2) install PyTorch nightly for CUDA 12.9
pip install -U --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu129
pip install sageattention

echo "Base installation completed."


