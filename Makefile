.PHONY: docker-init docker-run help

docker-init:
	docker images -q node:18-alpine || docker pull node:18-alpine

docker-run:
	docker run -it -v $$(pwd):/usr/src/app -w /usr/src/app node:18-alpine sh

help:
	@echo "docker-init: Initialize and setup the docker environment"
	@echo "docker-run: Run the docker container"
	@echo "help: Show this help message"
