#!/bin/bash

# Define model path
MODEL_PATH="/app/models/checkpoints/sd_xl_base_1.0.safetensors"
MODEL_URL="https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"

# Check if model exists, if not, download it
if [ ! -f "$MODEL_PATH" ]; then
    echo "Model not found at $MODEL_PATH. Downloading SDXL Base 1.0..."
    mkdir -p "$(dirname "$MODEL_PATH")"
    wget -c -O "$MODEL_PATH.tmp" "$MODEL_URL" && mv "$MODEL_PATH.tmp" "$MODEL_PATH"
else
    echo "Model already exists at $MODEL_PATH."
fi

# Start ComfyUI
echo "Starting ComfyUI..."
python main.py --listen 0.0.0.0
