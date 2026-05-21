FROM runpod/worker-comfyui:5.8.5-base

USER root
RUN apt-get update && apt-get install -y --no-install-recommends git

WORKDIR /comfyui/custom_nodes

RUN git clone --depth 1 https://github.com/city96/ComfyUI-GGUF.git
RUN git clone --depth 1 https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
RUN git clone --depth 1 https://github.com/ltdrdata/ComfyUI-Impact-Subpack.git
RUN git clone --depth 1 https://github.com/M1kep/ComfyLiterals.git
RUN git clone --depth 1 https://github.com/BadCafeCode/masquerade-nodes-comfyui.git
RUN git clone --depth 1 https://github.com/rgthree/rgthree-comfy.git
RUN git clone --depth 1 https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler.git

RUN pip install --no-cache-dir -r ComfyUI-GGUF/requirements.txt || true
RUN pip install --no-cache-dir -r ComfyUI-Impact-Pack/requirements.txt || true
RUN pip install --no-cache-dir -r ComfyUI-Impact-Subpack/requirements.txt || true
RUN pip install --no-cache-dir -r ComfyLiterals/requirements.txt || true
RUN pip install --no-cache-dir -r masquerade-nodes-comfyui/requirements.txt || true
RUN pip install --no-cache-dir -r rgthree-comfy/requirements.txt || true
RUN pip install --no-cache-dir -r ComfyUI-SeedVR2_VideoUpscaler/requirements.txt || true

RUN rm -rf /comfyui/models && ln -s /runpod-volume/models /comfyui/models

WORKDIR /
