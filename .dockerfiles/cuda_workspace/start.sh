build(){
    docker image build \
        --build-arg BASE_IMAGE=ubuntu:20.04 \
        --build-arg REQUIREMENTS_FILE=requirements.txt \
        -t wp-cuda \
        -f Dockerfile \
        .
}
run(){
    docker container run \
        --privileged \
        -it \
        -v ${HOME}:/environment \
        -p 4568:8888 \
        --name wp-cuda \
        wp-cuda
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


