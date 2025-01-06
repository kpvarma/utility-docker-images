# Docker Images for Development

This repository contains Dockerfiles and setup instructions for creating and using base and specialized Docker images for various programming languages and frameworks. Each image is designed to simplify the setup and management of development environments.

## Directory Structure
```
/
├── base/
│   ├── python/        # Base image for Python
│   ├── ruby/          # Base image for Ruby
│   ├── node/          # Base image for Node.js
├── specialized/
│   ├── python/
│   │   ├── django/    # Python image with Django pre-installed
│   │   ├── flask/     # Python image with Flask pre-installed
│   │   ├── fastapi/   # Python image with FastAPI pre-installed
│   ├── ruby/
│   │   ├── rails/     # Ruby image with Rails pre-installed
│   ├── node/
│   │   ├── npm/       # Node.js image with npm pre-installed
│   │   ├── npx/       # Node.js image with npx pre-installed
├── shared/            # Shared volume for development
├── docker-compose.yml # Compose file to manage all services
```

## Images Overview

### Base Images
- **Python Base (`base/python`)**
  - A lightweight Python environment with pip and virtualenv installed.
  - Use for running Python scripts or setting up general Python development environments.
  - Example: Testing Python utilities or creating Python-based CLI tools.
  - [Read More](./base/python/README.md)

- **Ruby Base (`base/ruby`)**
  - A minimal Ruby environment with Bundler installed.
  - Use for running Ruby scripts or setting up general Ruby development environments.
  - Example: Developing simple Ruby applications or experimenting with gems.
  - [Read More](./base/ruby/README.md)

- **Node.js Base (`base/node`)**
  - A basic Node.js environment with system tools like Git and Bash.
  - Use for running JavaScript applications or setting up a Node.js environment.
  - Example: Building Node.js libraries or CLI tools.
  - [Read More](./base/node/README.md)

### Specialized Images

#### Python Specialized
- **Django (`specialized/python/django`)**
  - Pre-installed with Django (`v4.2`) for rapid web development.
  - Example: Quickly create a Django web app and run a development server.
  - [Read More](./specialized/python/django/README.md)

- **Flask (`specialized/python/flask`)**
  - Pre-installed with Flask (`v2.3.2`) for lightweight web applications.
  - Example: Build lightweight web applications or APIs.
  - [Read More](./specialized/python/flask/README.md)

- **FastAPI (`specialized/python/fastapi`)**
  - Pre-installed with FastAPI and Uvicorn for modern web APIs.
  - Example: Create high-performance RESTful APIs or modern web backends.
  - [Read More](./specialized/python/fastapi/README.md)

#### Ruby Specialized
- **Rails (`specialized/ruby/rails`)**
  - Pre-installed with Rails (`v8.0.1`) for web application development.
  - Example: Develop scalable web applications with Rails.
  - [Read More](./specialized/ruby/rails/README.md)

#### Node.js Specialized
- **npm (`specialized/node/npm`)**
  - Pre-installed with npm for managing Node.js dependencies.
  - Use for managing Node.js project dependencies with npm.
  - [Read More](./specialized/node/npm/README.md)

- **npx (`specialized/node/npx`)**
  - Pre-installed with npx for executing Node.js packages.
  - Use for executing Node.js tools and scripts with npx.
  - [Read More](./specialized/node/npx/README.md)

## Quick Start with Docker Compose

To build and run all services, use the `docker-compose.yml` provided in the root directory:
```bash
docker-compose up --build
```

To work with a specific service, you can target individual services. For example:
```bash
docker-compose up python-base --build -d
docker-compose up python-django --build -d
docker-compose up python-flask --build -d
docker-compose up python-fastapi --build -d
docker-compose up ruby-base --build -d
docker-compose up ruby-rails --build -d
docker-compose up node-base --build -d
docker-compose up node-npm --build -d
docker-compose up node-npx --build -d
```

This command builds all the images and starts the containers for each service.

## Shared Volume
The `shared/` directory is mounted as a shared volume across all services. Use it to store and access project files.

## License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
