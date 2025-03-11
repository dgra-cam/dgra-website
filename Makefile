# https://docker.hugomods.com/docs/tags/
HUGO_IMAGE ?= hugomods/hugo
HUGO_VERSION ?= 0.145.0

DOCKER_RUN ?= docker run --rm -v $${PWD}:/src
PUBLISH_PORT ?= 1313

default: serve

serve:
	${DOCKER_RUN} \
		-p ${PUBLISH_PORT}:1313 \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo server

build:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo

vendor:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo mod vendor

pull:
	docker pull ${HUGO_IMAGE}:${HUGO_VERSION}

.PHONY: serve build vendor pull default
