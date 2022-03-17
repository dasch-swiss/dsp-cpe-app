# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
# THIS_FILE := $(lastword $(MAKEFILE_LIST))
THIS_FILE := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include vars.mk

#################################
# Build and publish targets
#################################
.PHONY: docker-build-app
docker-build-app: ## build APP image locally
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --load .

.PHONY: docker-build-mock-api
docker-build-mock-api: ## build mock API image locally
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE_MOCK_API) -t $(MOCK_API_REPO):latest --load $(CURRENT_DIR)/mock-api/.

.PHONY: docker-publish-app
docker-publish-app: ## publish APP Docker image to Docker-Hub
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --push .

.PHONY: docker-publish-mock-api
docker-publish-mock-api: ## build mock API image locally
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE_MOCK_API) -t $(MOCK_API_REPO):latest --push $(CURRENT_DIR)/mock-api/.

.PHONY: docker-run
docker-run: docker-build ## run docker image locally
	docker run -p 4200:4200 $(DOCKER_IMAGE)

.PHONY: build
build: ## build elm app
	@elm make src/Main.elm --output dist/app.js --optimize
	@cp index.html dist/index.html
	@cp -R assets dist/assets

.PHONY: build-dev
build-dev: ## build elm app in dev mode
	@elm-go src/Main.elm --pushstate -- --output="app.js" --debug

.PHONY: start-dev-server
start-dev-server: ## start local dev server hosting db.json
	@json-server --watch mock-api/db.json -p 2022

.PHONY: start-mock-api
start-mock-api: docker-build-mock-api ## start docker container hosting db.json
	@docker run -d -p 2022:3000 --name="CPE-Mock-API" -v $(CURRENT_DIR)/mock-api/db.json:/data/db/db.json $(DOCKER_IMAGE_MOCK_API)

.PHONY: stop-mock-api
stop-mock-api: ## stop docker container hosting db.json
	@docker stop CPE-Mock-API
	@docker rm CPE-Mock-API

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

.PHONY: heroicons
heroicons: ## run the script to update the heroicons library
	./get-heroicons-list.sh

.DEFAULT_GOAL := help
