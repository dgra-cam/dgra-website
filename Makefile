# Official Hugo image: https://github.com/gohugoio/hugo/pkgs/container/hugo
HUGO_IMAGE_NAME ?= ghcr.io/gohugoio/hugo
HUGO_VERSION ?= 0.169.0
HUGO_IMAGE ?= ${HUGO_IMAGE_NAME}:v${HUGO_VERSION}

# Skip the image's entrypoint, which runs "npm i" and prefixes all commands
# with "hugo". Use writable directories for npm and Hugo caches, whatever the
# user ID.
DOCKER_RUN ?= docker run --rm -u $$(id -u):$$(id -g) \
	-e HOME=/tmp -e HUGO_CACHEDIR=/tmp/hugo_cache \
	-v $${PWD}:/src -w /src --entrypoint ""
PUBLISH_PORT ?= 1313

# Docsy needs Dart Sass >= 1.95.0, but the image ships an older one. Use the
# native Dart Sass from the sass-embedded npm package instead. We don't use
# node_modules/.bin/sass: in the (Alpine) image, npm links it to the pure-JS
# Sass fallback, which Hugo can't use.
HUGO ?= PATH="$$(echo /src/node_modules/sass-embedded-linux-musl-*/dart-sass):$$PATH" hugo

# npm dependencies, installed from within the image so that we get the binaries
# for the image's platform (Alpine/musl). If you run "npm install" on the host,
# run "make deps" afterwards.
DEPS := node_modules/.package-lock.json

default: serve

deps:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		npm ci --ignore-scripts

${DEPS}: package-lock.json
	${MAKE} deps

serve: ${DEPS}
	${DOCKER_RUN} \
		-p ${PUBLISH_PORT}:1313 \
		${HUGO_IMAGE} \
		sh -c '${HUGO} server --bind 0.0.0.0 --buildDrafts --buildExpired --buildFuture'

build: ${DEPS}
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		sh -c '${HUGO}'

tidy:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		hugo mod tidy

update_docsy:
	${DOCKER_RUN} \
		${HUGO_IMAGE} \
		sh -c '\
		    hugo mod get -u github.com/docsy/docsy/theme@latest && \
		    hugo mod tidy && \
			hugo mod npm pack && \
			npm install --ignore-scripts'

pull:
	docker pull ${HUGO_IMAGE}

update_hugo:
	@if [ -z "$${VERSION}" ]; then \
		echo "usage: make update_hugo VERSION=1.2.3"; \
		exit 1; \
	fi;
	docker pull ${HUGO_IMAGE_NAME}:v$${VERSION}
	sed -i "s/^\( *HUGO_VERSION = \)\"\(.*\)\"/\1\"$${VERSION}\"/" netlify.toml
	sed -i "s/^\( *HUGO_VERSION ?= \)\(.*\)/\1$${VERSION}/" Makefile

shell:
	${DOCKER_RUN} \
		-it \
		${HUGO_IMAGE} \
		/bin/sh

.PHONY: default
.PHONY: deps
.PHONY: serve
.PHONY: build
.PHONY: tidy
.PHONY: update_docsy
.PHONY: update_hugo
.PHONY: pull
.PHONY: shell
