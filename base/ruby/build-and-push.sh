#!/bin/bash

# Array of Node.js versions
versions=("3.2.2")

# Docker Hub username
username="kpvarma"

# Loop through each version
for version in "${versions[@]}"; do
  dockerfile="ruby-${version}.dockerfile"
  image="${username}/ruby-${version}-base:latest"
  additional_tag="${username}/ruby-${version}-base:v1.0"

  echo "Building image: $image"
  docker build -f "$dockerfile" -t "$image" .

  echo "Tagging image with additional tag: $additional_tag"
  docker tag "$image" "$additional_tag"

  echo "Pushing image: $image"
  docker push "$image"

  echo "Pushing additional tag: $additional_tag"
  docker push "$additional_tag"
done
