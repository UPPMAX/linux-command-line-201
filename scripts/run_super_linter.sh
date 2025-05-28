#!/bin/bash
docker run \
  -e LOG_LEVEL=DEBUG \
  -e RUN_LOCAL=true \
  -v /path/to/local/codebase:/tmp/lint \
  ghcr.io/super-linter/super-linter:latest