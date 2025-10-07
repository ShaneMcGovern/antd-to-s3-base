#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Running post-create setup..."

echo "Installing Node.js lts/jod / 22.20.x..."
source /usr/local/share/nvm/nvm.sh && nvm install lts/jod

if [ -f package.json ]; then
    echo "Installing Node.js dependencies..."
    npm install
fi
