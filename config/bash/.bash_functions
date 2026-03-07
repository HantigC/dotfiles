function  dtop(){
    for container_id in `docker ps -a | awk '{print $1}'`
    do
        echo
        echo "Container Id: $container_id"
        docker container top $container_id
        echo
    done
}

function len(){
    ls | wc -w
}

function dce(){
    docker container exec -it $1 bash
}