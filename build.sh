#!/usr/bin/env bash

# Clone repository
git clone https://github.com/LLK/scratch-gui.git --single-branch --depth 1

cd scratch-gui

# Switch to latest stable version
git checkout $(git describe --tags --match 'scratch-desktop-v*')

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
