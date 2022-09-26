
IMAGE_NAME=hsc:python
CONTAINER_NAME=hsc-python
BASE_IMAGE=hsc:nvim


build:
	docker image build \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		-t $(IMAGE_NAME) \
		-f Dockerfile \
		.


run:
	docker container run \
		--privileged \
		-it \
		-v ${HOME}:/environment \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME)

remove:
	docker container rm $(CONTAINER_NAME)
