#!/usr/bin/env bash

# Clone repository at the latest stable version
git clone --single-branch --depth 1 --branch $(git ls-remote --tags --exit-code --refs "https://github.com/LLK/scratch-gui.git" --match "scratch-desktop-v*" | sed -E "s/^[[:xdigit:]]+[[:space:]]+refs\/tags\
/(.+)/\1/g" | sort -V | tail -n1) https://github.com/LLK/scratch-gui.git

cd scratch-gui

# Apply patches
git am ../patches/*.patch

# Build
npm ci --prefer-offline --no-audit
BUILD_MODE=dist npm run build
rm -rf ../dist
mv build ../dist

cd ..

# Cleanup
rm -rf scratch-gui
