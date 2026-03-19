#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

ROOT_DIR=${ROOT_DIR:-build-emscripten-web-dev}
PORT=${PORT:-8080}
BIND=${BIND:-0.0.0.0}

exec python3 tools/emscripten-web-serve.py \
  --root "${ROOT_DIR}" \
  --port "${PORT}" \
  --bind "${BIND}"
