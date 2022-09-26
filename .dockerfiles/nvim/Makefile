IMAGE_NAME=hsc:nvim
CONTAINER_NAME=hsc-nvim


build:
	docker image build \
		--build-arg BASE_IMAGE=ubuntu:20.04 \
		-t $(IMAGE_NAME) \
		-f Dockerfile \
		.


run:
	docker container run \
		--privileged \
		-it \
		-v ${HOME}:/environment \
		-p 4568:8888 \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME)

remove:
	docker container rm $(CONTAINER_NAME)
