DOCKER_REPO := daschswiss/dsp-cpe-app
MOCK_API_REPO := daschswiss/dsp-cpe-mock-api
CONFIG_REPO := daschswiss/dsp-cpe-config
ifeq ($(BUILD_TAG),)
	BUILD_TAG := $(shell git describe --tag --dirty --abbrev=7)
endif
ifeq ($(BUILD_TAG),)
	BUILD_TAG := $(shell git rev-parse --verify HEAD)
endif

ifeq ($(DOCKER_IMAGE),)
	DOCKER_IMAGE := $(DOCKER_REPO):$(BUILD_TAG)
endif

ifeq ($(DOCKER_IMAGE_MOCK_API),)
	DOCKER_IMAGE_MOCK_API := $(MOCK_API_REPO):$(BUILD_TAG)
endif

ifeq ($(DOCKER_IMAGE_CONFIG),)
	DOCKER_IMAGE_CONFIG := $(CONFIG_REPO):$(BUILD_TAG)
endif
