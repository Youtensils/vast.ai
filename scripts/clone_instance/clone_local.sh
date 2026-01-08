#!/bin/sh
# Clone local ComfyUI -> VastAI Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/clone_local.sh) 

#install aria2 for faster downloads
apt-get update && apt-get install -y aria2

#navigate to ComfyUI directory
cd /workspace/ComfyUI/

#download listing file
wget https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/scripts/clone_instance/listing.txt

#dowload custom nodes
cat listing.txt | grep custom_nodes | cut -d "/" -f5 | sort | uniq | grep -v pycache | grep -v websocket_image > custom_nodes_list.txt



cd loras
wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors
wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors

cd ../diffusion_models
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_1.3B_fp16.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_14B_fp16.safetensors

cd ../text_encoders
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors

cd ../vae
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors

cd /workspace 