#!/bin/bash

echo "Worker Initiated"

echo "Sourcing virtual env"
source /workspace/venv/bin/activate

echo "Starting WebUI API"
python /workspace/stable-diffusion-webui/webui.py --skip-python-version-check --skip-torch-cuda-test --skip-install --lowram --opt-sdp-attention --disable-safe-unpickle --port 3000 --api --nowebui --skip-version-check  --no-hashing --no-download-sd-model &

echo "Starting RunPod Handler"
python -u /handler.py
