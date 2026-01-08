#!/bin/sh
# WAN 2.2 5B Fun Inpaint Install Script
# to run in Jupyter terminal:
# bash <(wget -qO- https://raw.githubusercontent.com/Youtensils/vast.ai/refs/heads/main/template_installs/wan2.2-14B_fun_inpaint.sh) 


cd ComfyUI/models
cd diffusion_models/
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_fun_inpaint_high_noise_14B_fp8_scaled.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_fun_inpaint_low_noise_14B_fp8_scaled.safetensors
cd ../loras
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors
wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors
cd ../vae
wget 

