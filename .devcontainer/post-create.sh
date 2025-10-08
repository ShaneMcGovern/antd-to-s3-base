#!/bin/bash

# Exit immediately if a command exits with a non-zero status
# -e: exit on error
# -u: exit on undefined variable
# -o pipefail: prevent piped commands from masking errors
set -euo pipefail

echo "Running post-create setup..."

# Install specific Node.js version
if [ -f /usr/local/share/nvm/nvm.sh ]; then
    source /usr/local/share/nvm/nvm.sh
    nvm install lts/jod
    nvm alias default lts/jod  # Set as default
    nvm use lts/jod
else
    echo "ERROR: nvm not found at expected location" >&2
    exit 1
fi

export 'NPM_CONFIG_UPDATE_NOTIFIER=false' >> ~/.bashrc

# Install dependencies if package.json exists
if [ -f package.json ]; then
    echo "Installing Node.js dependencies..."
    npm ci || npm install
fi

echo "Post-create setup completed successfully"