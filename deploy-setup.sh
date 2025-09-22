#!/bin/bash

# Server Setup Script for PM2 Deployment
# Run this script on your server to set up the application

set -e

echo "Setting up github-action-fs-2 for PM2 deployment..."

# Install Node.js 20 if not already installed
if ! command -v node &> /dev/null; then
    echo "Installing Node.js 20..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install pnpm globally if not already installed
if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    npm install -g pnpm@9
fi

# Install PM2 globally if not already installed
if ! command -v pm2 &> /dev/null; then
    echo "Installing PM2..."
    npm install -g pm2
fi

# Create application directory
APP_DIR="/var/www/github-action-fs-2"
if [ ! -d "$APP_DIR" ]; then
    echo "Creating application directory..."
    sudo mkdir -p $APP_DIR
    sudo chown $USER:$USER $APP_DIR
fi

# Clone or update repository
if [ ! -d "$APP_DIR/.git" ]; then
    echo "Cloning repository..."
    git clone https://github.com/your-username/github-action-fs-2.git $APP_DIR
else
    echo "Repository already exists, pulling latest changes..."
    cd $APP_DIR
    git pull origin main
fi

cd $APP_DIR

# Install dependencies
echo "Installing dependencies..."
pnpm install --frozen-lockfile

# Build the application
echo "Building application..."
pnpm run build

# Create logs directory
mkdir -p logs

# Set up PM2 startup script
echo "Setting up PM2 startup..."
pm2 startup

echo "Setup complete!"
echo ""
echo "To start the application:"
echo "  cd $APP_DIR"
echo "  pm2 start ecosystem.config.js --env production"
echo "  pm2 save"
echo ""
echo "To monitor the application:"
echo "  pm2 monit"
echo "  pm2 logs"
echo ""
echo "Make sure to update the ecosystem.config.js file with your server details!"
