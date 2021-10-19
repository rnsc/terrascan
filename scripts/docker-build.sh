#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null)
DOCKER_REPO="accurics/terrascan"
DOCKERFILE="./build/Dockerfile"

docker buildx build --platform linux/amd64,linux/arm64 -t ${DOCKER_REPO}:${GIT_COMMIT} -f ${DOCKERFILE} .
