#!/bin/sh
# WAN 2.2 5B Fun Inpaint Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/wan2.2-5B_fun_inpaint.sh) 


cd ComfyUI/models
cd vae
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan2.2_vae.safetensors
cd ../diffusion_models/
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_fun_inpaint_5B_bf16.safetensors
cd ../

