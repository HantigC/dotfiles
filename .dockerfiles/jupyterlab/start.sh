case $1 in
    build-cuda)
        docker image build \
            --build-arg BASE_IMAGE=nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu20.04 \
            --build-arg REQUIREMENTS_FILE=requirements.dev.txt \
            -t hsc-cuda-wp \
            -f cuda.Dockerfile \
            .
        ;;

    run-cuda)
        docker container run \
            --gpus all \
            --privileged \
            -it \
            -v /data:/data \
            --shm-size=64gb \
            --name hsc-cuda-wp \
            hsc-cuda-wp \
            bash
        ;;
esac


