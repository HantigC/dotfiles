function  dtop(){
    for container_id in `docker ps -a | awk '{print $1}'`
    do
        echo
        echo "Container Id: $container_id"
        docker container top $container_id
        echo
    done
}
function install_telescope_dep(){
    sudo apt-get install ripgrep fd-find
}

function install_pyenv(){
    sudo apt-get install -y \
        make \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        python-openssl
    curl https://pyenv.run | bash

}

function install_nerdfonts(){
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts \
        && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" \
            https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
}

function len(){
    ls | wc -w
}

function install_neovim_pre(){
    sudo apt-get install \
        ninja-build \
        gettext \
        libtool \
        libtool-bin \
        autoconf \
        automake \
        cmake \
        g++ \
        pkg-config \
        unzip \
        curl \
        doxygen
}
function dce(){
    docker container exec -it $1 bash
}

function install_python_dev(){
    if [ -f "${HOME}/.dev.requirements.txt" ]; then
        python -m pip install -r "${HOME}/.dev.requirements.txt"
    fi
}
