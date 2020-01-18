
IMAGENAME=m3h7/ccu-historian
HISTORIAN_RELEASE=2.3.0
BUILD=1

REGISTRY=spurv:5000

IMAGE_BASE_DIR=./image

.PHONY: all
all: usage

usage:
	@echo "CCU-Historian Docker Build and Push"
	@echo "Usage:"
	@echo "  make pull-base             - Pull the base image"
	@echo "  make build                 - Build the Docker image"
	@echo "  make login|logout					- Login | Logout from registry"
	@echo "  echo <APIKEY> | make push  - Push image to registry"

pull-base:
	podman pull openjdk:11-jre

build:
	podman build --tag ${IMAGENAME} --build-arg HISTORIAN_RELEASE=${HISTORIAN_RELEASE} ${IMAGE_BASE_DIR}

tag:
	podman tag ${IMAGENAME} ${IMAGENAME}:${HISTORIAN_RELEASE}-${BUILD}
	podman tag ${IMAGENAME} ${REGISTRY}/${IMAGENAME}:${HISTORIAN_RELEASE}-${BUILD}

push:
	podman push --tls-verify=false ${REGISTRY}/${IMAGENAME}:${HISTORIAN_RELEASE}-${BUILD}
