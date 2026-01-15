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

#Install pyenv to manage python versions
curl -fsSL https://pyenv.run | bash
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.10.13
cd /workspace/ComfyUI/YT/voicer/Retrieval-based-Voice-Conversion-WebUI

# Make sure pyenv is active in this shell
eval "$(pyenv init -)"

# Tell pyenv to use 3.10.13 for this directory
pyenv local 3.10.13

# Check it worked
python -V
# should show Python 3.10.13
python -m venv .venv
source .venv/bin/activate

# Upgrade pip so old wheels install cleanly
pip install --upgrade pip
cd /workspace/ComfyUI/YT/voicer/Retrieval-based-Voice-Conversion-WebUI

# Make sure venv is active
source .venv/bin/activate  # or whatever you named it

# 1) Downgrade pip inside this venv
python -m pip install "pip==24.0"   # or: "pip<24.1"

# 2) (Optional, but can help)
pip cache purge

# 3) Install requirements again
pip install -r requirements.txt





#Download all needed models from https://huggingface.co/lj1995/VoiceConversionWebUI/tree/main/
python3 tools/download_models.py

