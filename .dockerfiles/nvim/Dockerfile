ARG BASE_IMAGE=ubuntu:18.04
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp/neovim
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        software-properties-common \
        ca-certificates \
        bzip2 \
        git \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        ripgrep \
        fd-find \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        unzip \
        curl \
        doxygen \
    && git clone https://github.com/neovim/neovim /tmp/neovim \
    && make && make install \
    && git clone --bare https://github.com/HantigC/dotfiles.git $HOME/.dotfiles \
    && git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout


CMD ["bash"]
