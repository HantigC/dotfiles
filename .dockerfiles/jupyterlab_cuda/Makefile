IMAGE_NAME=cuda-jupyterlab:hsc
CONTAINER_NAME=cuda-jupyterlab-hsc
BASE_IMAGE=nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu20.04
REQUIREMENTS_FILE=requirements.txt
FROM_DIRECTORY=${HOME}
CMD="python -m jupyter lab --allow-root --port=8888 --ip=0.0.0.0"
WORKDIR="/"

.PHONY: build run remove clear

build:
	docker image build \
		--build-arg  BASE_IMAGE=${BASE_IMAGE} \
		--build-arg  REQUIREMENTS_FILE=${REQUIREMENTS_FILE} \
		-t ${IMAGE_NAME} \
		-f Dockerfile \
		.

run:
	docker container run \
		--gpus all \
		--privileged \
		-it \
		-v ${FROM_DIRECTORY}:/environment \
		--workdir ${WORKDIR} \
		-p 4568:8888 \
		--shm-size "32gb" \
		--name ${CONTAINER_NAME} \
		${IMAGE_NAME}
		-c ${CMD}

remove:
	docker container rm ${CONTAINER_NAME} 2>/dev/null || echo "container `${CONTAINER_NAME}` doesn't exist"


clear:
	docker container rm ${IMAGE_NAME} 2>/dev/null || echo "image `${IMAGE_NAME}` doesn't exist"
	docker container rm ${CONTAINER_NAME} 2>/dev/null || echo "container `${CONTAINER_NAME}` doesn't exist"
