function  dtop(){
    for container_id in `docker ps -a | awk '{print $1}'`
    do
        echo
        echo "Container Id: $container_id"
        docker container top $container_id
        echo
    done
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


function len(){
    ls | wc -w
}

function dce(){
    docker container exec -it $1 bash
}

function install_python_dev(){
    if [ -f "${HOME}/.dev.requirements.txt" ]; then
        python -m pip install -r "${HOME}/.dev.requirements.txt"
    fi
}
