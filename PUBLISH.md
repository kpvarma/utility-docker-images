# Building and Pushing Docker Images to Docker Hub

This document explains how to build and push Docker images to the Docker Hub repository `kpvarma`. It also provides details on how the `build-and-push.sh` script works.

---

## Prerequisites

1. **Docker Installed**: Ensure Docker is installed and running on your system.
2. **Docker Hub Account**: You need a Docker Hub account. Log in using:
   ```bash
   docker login
   ```
3. **Access to the Repository**: Ensure you have permission to push images to the `kpvarma` repository.

---

## Building and Pushing Images Manually

If you want to build and push images manually, follow these steps:

1. **Navigate to the Node Base Directory**:
   ```bash
   cd /Users/kpvarma/Workspace/My Lab/Utilities/utility-docker-images/base/node
   ```

2. **Build the Image**:
   Use the `docker build` command to build the image. For example:
   ```bash
   docker build -f node-21.dockerfile -t kpvarma/node-21-base:latest .
   ```

3. **Tag the Image**:
   Add an additional tag to the image:
   ```bash
   docker tag kpvarma/node-21-base:latest kpvarma/node-21-base:v1.0
   ```

4. **Push the Image**:
   Push both tags to Docker Hub:
   ```bash
   docker push kpvarma/node-21-base:latest
   docker push kpvarma/node-21-base:v1.0
   ```

Repeat these steps for other versions (`node-22`, `node-23`, etc.).

---

## Using the `build-and-push.sh` Script

To simplify the process, you can use the `build-and-push.sh` script. This script automates the building, tagging, and pushing of images for multiple Node.js versions.

### How the Script Works

1. **Node.js Versions**:
   The script defines an array of Node.js versions:
   ```bash
   versions=("21" "22" "23")
   ```

2. **Docker Hub Username**:
   The script uses the Docker Hub username `kpvarma`:
   ```bash
   username="kpvarma"
   ```

3. **Loop Through Versions**:
   For each version, the script:
   - Builds the image using the corresponding Dockerfile.
   - Tags the image with `latest` and `v1.0`.
   - Pushes both tags to Docker Hub.

4. **Commands in the Script**:
   - **Build the Image**:
     ```bash
     docker build -f "$dockerfile" -t "$image" .
     ```
   - **Tag the Image**:
     ```bash
     docker tag "$image" "$additional_tag"
     ```
   - **Push the Image**:
     ```bash
     docker push "$image"
     docker push "$additional_tag"
     ```

### Running the Script

1. **Navigate to the Script Directory**:
   ```bash
   cd /Users/kpvarma/Workspace/My Lab/Utilities/utility-docker-images/base/node
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x build-and-push.sh
   ```

3. **Run the Script**:
   ```bash
   ./build-and-push.sh
   ```

The script will automatically build, tag, and push images for all specified Node.js versions.

---

## Verifying the Images on Docker Hub

After running the script, verify that the images are available on Docker Hub:
1. Visit [https://hub.docker.com/](https://hub.docker.com/).
2. Search for the `kpvarma` repository.
3. Check for the images with tags `latest` and `v1.0`.

---

## Conclusion

The `build-and-push.sh` script simplifies the process of building and pushing Docker images for multiple Node.js versions. Use this script to ensure consistency and save time when managing Docker images for your projects.
