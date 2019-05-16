#! /bin/bash
# Install Docker CE + nvidia-docker version 2.0
sudo apt-get remove -y docker docker-engine docker.io \
    && sudo apt-get update \
    && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
    &&  curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | sudo apt-key add - \
    && sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" \
    && sudo apt-get update \
    && sudo apt-get install -y docker-ce \
    && sudo docker run hello-world \
    && sudo docker volume ls -q -f driver=nvidia-docker \
    | xargs -r -I{} -n1 docker ps -q -a -f volume={} \
    | xargs -r docker rm -f \
    && sudo apt-get purge -y nvidia-docker || true \
    && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
    && curl -s -L "https://nvidia.github.io/nvidia-docker/$(. /etc/os-release; echo $ID$VERSION_ID)/nvidia-docker.list" \
    | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
    && sudo apt-get update \
    && sudo apt-get install -y nvidia-docker2 \
    && sudo pkill -SIGKILL dockerd \
    && sudo docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi \
    && echo Docker CE and nvidia-docker successfully installed.