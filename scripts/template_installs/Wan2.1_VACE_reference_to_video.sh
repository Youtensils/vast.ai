#!/bin/sh
# WAN 2.1 Vace Reference to Video Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/Wan2.1_VACE_reference_to_video.sh) 


cd ComfyUI/models
cd diffusion_models/
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_14B_fp16.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_1.3B_fp16.safetensors
cd ../text_encoders
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
cd ../loras
wget https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors
wget https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors
cd ../vae
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
cd ../clip
wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors
cd /workspace 