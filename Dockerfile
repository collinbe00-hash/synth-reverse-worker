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
RUN pip install --no-cache-dir transformers
RUN pip install --no-cache-dir diffusers peft
RUN pip install --no-cache-dir ultralytics
RUN pip install --no-cache-dir scikit-image scipy
RUN pip install --no-cache-dir opencv-python segment-anything piexif dill omegaconf einops rotary_embedding_torch gguf psutil matplotlib tqdm
RUN for d in */ ; do cd $d ; test -f requirements.txt && pip install --no-cache-dir -r requirements.txt || true ; cd .. ; done
RUN rm -rf /comfyui/models && ln -s /runpod-volume/models /comfyui/models
WORKDIR /
