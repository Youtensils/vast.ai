#!/bin/bash
# Install and Launch Voice Changer Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/voice_changer/start.sh)

BASEDIR=/workspace/ComfyUI
cd $BASEDIR

mkdir -p $BASEDIR/YT/voicer
cd $BASEDIR/YT/voicer

git clone https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI.git
cd Retrieval-based-Voice-Conversion-WebUI/

#install dependencied
pip install torch torchvision torchaudio
curl -sSL https://install.python-poetry.org | python3 -
export PATH="/root/.local/bin:$PATH"
poetry install
pip install -r requirements.txt

apt install ffmpeg

#Download all needed models from https://huggingface.co/lj1995/VoiceConversionWebUI/tree/main/
python3 tools/download_models.py

