#!/bin/bash

# Script to copy Dockerfile and docker-compose.yml for Rails into APP_DIR

# Exit script if any command fails
set -e

# Check if APP_DIR is set
if [ -z "$APP_DIR" ]; then
    echo "Error: APP_DIR environment variable is not defined."
    exit 1
fi

# Check if APP_DIR is a valid directory
if [ ! -d "$APP_DIR" ]; then
    echo "Error: APP_DIR is not a valid directory."
    exit 1
fi

# Define the source files
RAILS_DOCKERFILE="utils/rails-dockerfile"
RAILS_DOCKER_COMPOSE="utils/rails-docker-compose.yml"

# Check if the source files exist
if [ ! -f "$RAILS_DOCKERFILE" ]; then
    echo "Error: $RAILS_DOCKERFILE does not exist."
    exit 1
fi

if [ ! -f "$RAILS_DOCKER_COMPOSE" ]; then
    echo "Error: $RAILS_DOCKER_COMPOSE does not exist."
    exit 1
fi

# Copy and rename files
cp "$RAILS_DOCKERFILE" "$APP_DIR/Dockerfile"
cp "$RAILS_DOCKER_COMPOSE" "$APP_DIR/docker-compose.yml"

# Success message
echo "Dockerfile and docker-compose.yml successfully copied to $APP_DIR."