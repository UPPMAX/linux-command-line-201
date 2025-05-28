#!/bin/bash
#
# Run the Super Linter, with 
# homepage at https://github.com/super-linter/super-linter
# 
# Usage:
#
#   ./scripts/run_super_linter.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/run_super_linter.sh"
    echo " "
    exit 42
fi

mkdir /tmp/lint
touch /tmp/lint/README.md

mkdir tmp
touch tmp/README.md

export GITHUB_WORKSPACE=${PWD}
export GITHUB_SHA=$(git -C . rev-parse HEAD)


# Run locally
docker run \
  -e RUN_LOCAL=true \
  --volume "${PWD}:${PWD}/tmp/README.md" \
  ghcr.io/super-linter/super-linter:latest
