#!/bin/bash
set -euxo pipefail

cd "$(dirname "$0")"
export DOCKER_BUILDKIT=${DOCKER_BUILDKIT:-1}
BUILD_LOG=${BUILD_LOG:-docker-browser-dev-build.log}
BUILD_TYPE=${BUILD_TYPE:-Release}
BUILD_DIR=${BUILD_DIR:-build-emscripten-dev}
IMAGE_NAME=${IMAGE_NAME:-otclient-web-dev}
CONTAINER_NAME=${CONTAINER_NAME:-otclient-web-dev-tmp}
VCPKG_DOWNLOADS_DIR=${VCPKG_DOWNLOADS_DIR:-${BUILD_DIR}/vcpkg-downloads}

: > "${BUILD_LOG}"
mkdir -p "${BUILD_DIR}"
mkdir -p "${VCPKG_DOWNLOADS_DIR}"

docker build --progress=plain \
  --build-arg BUILD_TYPE="${BUILD_TYPE}" \
  -t "${IMAGE_NAME}" \
  -f Dockerfile.browser.dev . 2>&1 | tee -a "${BUILD_LOG}"

docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
docker run --name "${CONTAINER_NAME}" --rm \
  -e BUILD_DIR="/workspace/${BUILD_DIR}" \
  -v "$(pwd)/${VCPKG_DOWNLOADS_DIR}:/opt/vcpkg/downloads" \
  -v "$(pwd):/workspace" \
  "${IMAGE_NAME}:latest" 2>&1 | tee -a "${BUILD_LOG}"
