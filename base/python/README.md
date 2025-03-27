
# Python Base Image

This is a base Docker image for Python projects, built on top of the official `python:3.9-slim` image. It includes essential tools and configurations for Python development.

## Features
- Lightweight Python environment with pip and virtualenv pre-installed.
- Based on `python:3.9-slim` for a lightweight setup.
- Pre-installed essential system dependencies (`build-essential`, `libssl-dev`, etc.).
- Ready for use as a base image for Python projects or specialized images.
- Ideal for development, testing, and automation workflows.

## Usage with Docker Compose

### 1. General Python Development
Run a Python script using the `python-base` service in the `docker-compose.yml`:
```bash
docker compose up python-base --build
```

### 2. Testing Python Utilities
Test libraries or dependencies in an isolated environment:
```bash
docker compose run --rm python-base python -m pip install some-library
```

### 3. Use in CI/CD Pipelines
Integrate the image into CI/CD workflows to automate Python testing. Example GitHub Actions snippet:
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      python-base:
        image: python-base:latest
    steps:
    - run: python -m unittest discover
```

### 4. Education and Tutorials
Use the container as a pre-configured environment for teaching Python:
```bash
docker compose up python-base --build
```

### 5. Prototyping
Quickly prototype Python scripts by running an interactive shell:
```bash
docker compose run --rm python-base bash
```

### 6. Running Python-Based Tools
Run Python-based CLI tools like `black` or `pytest`:
```bash
docker compose run --rm python-base python -m pip install black
docker compose run --rm python-base black your_script.py
```

### 7. Base for Specialized Python Images
Extend the base image for specific frameworks like Flask or Django using `docker compose` to spin up specialized services.

Example for Flask (`python-flask` service):
```bash
docker compose up python-flask --build
```

### 8. Isolated Environment for Dependency Management
Test specific library versions without polluting the host environment:
```bash
docker compose run --rm python-base pip install "requests==2.25.1"
```

### 9. Cross-Platform Consistency
Ensure consistent behavior of Python scripts across different operating systems by testing in the container:
```bash
docker compose run --rm python-base python script.py
```

## Shared Volume
The `shared/` directory can be used as a mounted volume at `/app` to store and access project files across services.
