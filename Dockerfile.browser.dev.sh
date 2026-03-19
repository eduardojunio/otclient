#!/bin/bash
set -euxo pipefail

cd "$(dirname "$0")"
export DOCKER_BUILDKIT=${DOCKER_BUILDKIT:-1}
BUILD_TYPE=${BUILD_TYPE:-RelWithDebInfo}
BUILD_LOG=${BUILD_LOG:-docker-browser-build.dev.log}
OUTPUT_DIR=${OUTPUT_DIR:-build-emscripten-web-dev}
IMAGE_TAG=${IMAGE_TAG:-otclient-web-dev}
CONTAINER_NAME=${CONTAINER_NAME:-otclient-web-dev-tmp}
JOBS=${JOBS:-2}
EMCC_CORES=${EMCC_CORES:-1}
BINARYEN_CORES=${BINARYEN_CORES:-1}

: > "${BUILD_LOG}"
mkdir -p "${OUTPUT_DIR}"
find "${OUTPUT_DIR}" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
docker build --progress=plain \
  --build-arg BUILD_TYPE="${BUILD_TYPE}" \
  --build-arg JOBS="${JOBS}" \
  --build-arg EMCC_CORES="${EMCC_CORES}" \
  --build-arg BINARYEN_CORES="${BINARYEN_CORES}" \
  -t "${IMAGE_TAG}" -f Dockerfile.browser.dev . 2>&1 | tee -a "${BUILD_LOG}"
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
docker create --name "${CONTAINER_NAME}" "${IMAGE_TAG}:latest"
docker cp "${CONTAINER_NAME}:/otclient-web/." "${OUTPUT_DIR}"
docker rm "${CONTAINER_NAME}"
