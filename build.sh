#!/usr/bin/env bash

# Clone repository
git clone https://github.com/LLK/scratch-gui.git --branch develop --single-branch

cd scratch-gui

# Apply patches
git am ../patches/*.patch

# Build
npm install
npm run build
mv build ../dist

cd ..

# Cleanup
rm -rf scratch-gui
