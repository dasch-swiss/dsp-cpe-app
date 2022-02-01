# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
# THIS_FILE := $(lastword $(MAKEFILE_LIST))
THIS_FILE := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include vars.mk

#################################
# Build and publish targets
#################################
.PHONY: docker-build
docker-build: ## build APP image locally
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --load .

.PHONY: docker-publish
docker-publish: ## publish APP Docker image to Docker-Hub
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --push .

.PHONY: docker-run
docker-run: docker-build ## run docker image locall
	docker run -p 4200:4200 $(DOCKER_IMAGE)

.PHONY: build
build: ## build elm app
	@elm make src/PhotoGroove.elm --output dist/app.js --optimize
	@cp index.html dist/index.html
	@cp -R assets dist/assets

.PHONY: test
test: ## run all tests
	@elm-test

.PHONY: clean
clean: ## delete elm and node dependencies
	@rm -rf elm-stuff/
	@rm -rf dist/

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.DEFAULT_GOAL := help
