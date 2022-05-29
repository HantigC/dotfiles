ARG BASE_IMAGE=ubuntu:18.04
FROM ${BASE_IMAGE}

ARG PYTHON=python3.7
ARG REQUIREMENTS_FILE=requirements.txt
ENV DEBIAN_FRONTEND=noninteractive

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
        ${PYTHON}-venv \
        ${PYTHON}-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /environment/.python_envs
COPY ${REQUIREMENTS_FILE} requirements.txt

RUN ${PYTHON} -m venv default \
    && /environment/.python_envs/default/bin/python3.7 -m pip install --upgrade pip wheel \
    && /environment/.python_envs/default/bin/python3.7 -m pip install -r requirements.txt

CMD ["bash"]
