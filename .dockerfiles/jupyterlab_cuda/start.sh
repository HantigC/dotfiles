build(){
    docker image build \
        --build-arg BASE_IMAGE=nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu20.04 \
        --build-arg REQUIREMENTS_FILE=requirements.txt \
        -t cuda-jupyterlab \
        -f Dockerfile \
        .
}
run(){
    docker container run \
        --gpus all \
        --privileged \
        -it \
        -v ${HOME}:/environment \
        -p 4569:8888 \
        --shm-size "32gb" \
        --name jupyterlab \
        cuda-jupyterlab
}

case $1 in
    build)
        build
        ;;

    run)
        run
        ;;
    build-run)
        build
        run
        ;;
esac


