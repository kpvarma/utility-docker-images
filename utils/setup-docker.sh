#!/bin/bash

# Script to copy Dockerfile and docker-compose.yml for a specified framework into APP_DIR

# Exit script if any command fails
set -e

# Print usage if arguments are missing and APP_DIR is not set
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <framework> [APP_DIR]"
    echo "Framework options: rails, nextjs, nuxtjs, django, fastapi, expressjs, flaskm react-native"
    exit 1
fi

# Assign command-line arguments to variables
FRAMEWORK=$1
APP_DIR=${2:-$APP_DIR}  # Use the second argument if provided, otherwise use the environment variable

# Check if APP_DIR is set
if [ -z "$APP_DIR" ]; then
    echo "Error: APP_DIR environment variable is not set, and no directory was provided."
    exit 1
fi

# Print the provided arguments
echo "Framework: $FRAMEWORK"
echo "Application Directory: $APP_DIR"

# Validate the APP_DIR
if [ ! -d "$APP_DIR" ]; then
    echo "Error: $APP_DIR is not a valid directory."
    exit 1
fi

# Get Dockerfile and docker-compose file paths based on the framework
get_dockerfile() {
    case $1 in
        rails) echo "utils/dockerfile-rails" ;;
        nextjs) echo "utils/dockerfile-nextjs" ;;
        nuxtjs) echo "utils/dockerfile-nuxtjs" ;;
        django) echo "utils/dockerfile-django" ;;
        fastapi) echo "utils/dockerfile-fastapi" ;;
        expressjs) echo "utils/dockerfile-expressjs" ;;
        flask) echo "utils/dockerfile-flask" ;;
        react-native) echo "utils/dockerfile-react-native" ;;
        *) echo ""; exit 1 ;;
    esac
}

get_docker_compose() {
    case $1 in
        rails) echo "utils/docker-compose-rails.yml" ;;
        nextjs) echo "utils/docker-compose-nextjs.yml" ;;
        nuxtjs) echo "utils/docker-compose-nuxtjs.yml" ;;
        django) echo "utils/docker-compose-django.yml" ;;
        fastapi) echo "utils/docker-compose-fastapi.yml" ;;
        expressjs) echo "utils/docker-compose-expressjs.yml" ;;
        flask) echo "utils/docker-compose-flask.yml" ;;
        react-native) echo "utils/docker-compose-react-native.yml" ;;
        *) echo ""; exit 1 ;;
    esac
}

DOCKERFILE=$(get_dockerfile "$FRAMEWORK")
DOCKER_COMPOSE=$(get_docker_compose "$FRAMEWORK")

# Validate the source files
if [ ! -f "$DOCKERFILE" ]; then
    echo "Error: $DOCKERFILE does not exist."
    exit 1
fi

if [ ! -f "$DOCKER_COMPOSE" ]; then
    echo "Error: $DOCKER_COMPOSE does not exist."
    exit 1
fi

# Print the files being copied
#echo "Copying Dockerfile: $DOCKERFILE"
#echo "Copying docker-compose.yml: $DOCKER_COMPOSE"

# Copy and rename files
cp "$DOCKERFILE" "$APP_DIR/Dockerfile"
cp "$DOCKER_COMPOSE" "$APP_DIR/docker-compose.yml"

# Success message
echo ""
echo "Successfully copied Dockerfile for $FRAMEWORK to $APP_DIR."
echo "Successfully copied docker-compose.yml for $FRAMEWORK to $APP_DIR."