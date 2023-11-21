#!/bin/bash
set -euo pipefail

LATEST_VERSION=$(curl -s https://api.github.com/repos/coveooss/gotemplate/releases/latest | jq -r '.tag_name' | sed 's/v//')
DOCKER_REPO="rorylshanks"
DOCKER_IMAGE_NAME="gotemplate"
TARGET_ARCHS="linux/amd64,linux/arm64"

if docker manifest inspect ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${LATEST_VERSION} > /dev/null; then
    echo "Image with version ${LATEST_VERSION} already exists. Skipping build."; 
    exit 0; 
fi
docker buildx create --use
docker buildx build --platform ${TARGET_ARCHS} --build-arg GOTEMPLATE_VERSION=${LATEST_VERSION} -t ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${LATEST_VERSION} -t ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:latest --push .