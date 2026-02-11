# https://docker.hugomods.com/docs/tags/
HUGO_IMAGE ?= hugomods/hugo
HUGO_VERSION ?= 0.155.3

DOCKER_RUN ?= docker run --rm -v $${PWD}:/src
PUBLISH_PORT ?= 1313

default: serve

serve:
	${DOCKER_RUN} \
		-p ${PUBLISH_PORT}:1313 \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo server --buildDrafts --buildExpired --buildFuture

build:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo

vendor:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo mod vendor

tidy:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo mod tidy

update_docsy:
	${DOCKER_RUN} \
		${HUGO_IMAGE}:${HUGO_VERSION} \
		hugo mod get -u github.com/google/docsy

pull:
	docker pull ${HUGO_IMAGE}:${HUGO_VERSION}

.PHONY: serve build vendor tidy pull default update_docsy
