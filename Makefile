# https://docker.hugomods.com/docs/tags/
HUGO_IMAGE_NAME ?= hugomods/hugo
HUGO_VERSION ?= 0.155.3
HUGO_IMAGE ?= ${HUGO_IMAGE_NAME}:${HUGO_VERSION}

DOCKER_RUN ?= docker run --rm -u $${UID}:$${GID} -v $${PWD}:/src
PUBLISH_PORT ?= 1313

default: serve

serve:
	${DOCKER_RUN} \
		-p ${PUBLISH_PORT}:1313 \
		${HUGO_IMAGE} \
		hugo server --buildDrafts --buildExpired --buildFuture

install_postcss:
	${DOCKER_RUN} ${HUGO_IMAGE} \
		npm install --save-dev autoprefixer
		npm install --save-dev postcss-cli
		npm install --save-dev postcss

build:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		hugo

vendor:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		hugo mod vendor

tidy:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		hugo mod tidy

update_docsy:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		hugo mod get -u github.com/google/docsy

pull:
	docker pull ${HUGO_IMAGE}

update_hugo:
	@if [[ -z "$${VERSION}" ]]; then \
		echo "usage: make update_hugo VERSION=1.2.3"; \
		exit 1; \
	fi;
	sed -i "s/^\( *HUGO_VERSION = \)\"\(.*\)\"/\1\"$${VERSION}\"/" netlify.toml
	sed -i "s/^\( *HUGO_VERSION ?= \)\(.*\)/\1$${VERSION}/" Makefile

.PHONY: default
.PHONY: serve
.PHONY: install_postcss
.PHONY: build
.PHONY: vendor
.PHONY: tidy
.PHONY: update_docsy
.PHONY: update_hugo
.PHONY: pull
