## Commands

- Run `bash Dockerfile.browser.dev.sh` to build the WASM client after changes.
- Warm builds takes about 2 minutes and cold builds can take around 16 minutes. Think carefully before deciding to rebuild the WASM client.
- Avoid building if there are builds currently present (e.g., `build-emscripten-web-dev` directory exists).
- Run `bash serve-browser-dev.sh` to start the web server for the WASM client (after it's built).
