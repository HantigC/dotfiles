ARG BASE_IMAGE=nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu18.04
FROM ${BASE_IMAGE}

ARG PYTHON=python3.7
ARG REQUIREMENTS_FILE=requirements.txt
ENV DEBIAN_FRONTEND=noninteractive

RUN rm -f /etc/apt/sources.list.d/cuda.list
RUN rm -f /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        software-properties-common \
        zip \
        htop \
        screen \
        libgl1-mesa-glx \
        wget \
        graphviz \
        automake \
        autoconf \
        libopencv* \
        cmake \
        sudo \
        curl \
        unzip \
        nano \
        ca-certificates \
        bzip2 \
        git \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && apt-get install --no-install-recommends -y \
        ${PYTHON} \
        python3-pip \
        python3-setuptools \
        python3.7-venv \
        python3.7-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/neovim
RUN git clone --bare https://github.com/HantigC/dotfiles.git $HOME/.dotfiles \
    && git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout \
    && wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb \
    && apt-get install ./nvim-linux64.deb

WORKDIR /.python_envs
RUN ${PYTHON} -m venv default
ENV DEFAULT_ENV=/.python_envs/default/bin
ENV PATH ${DEFAULT_ENV}:${PATH}


COPY ${REQUIREMENTS_FILE} requirements.txt
RUN python -m pip install --upgrade pip wheel \
    && python -m pip install -r requirements.txt


WORKDIR /
CMD python -m jupyter lab --allow-root --port=8888 --ip=0.0.0.0
