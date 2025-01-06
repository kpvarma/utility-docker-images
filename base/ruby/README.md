
# Ruby Base Image

This is a base Docker image for Ruby projects, built on top of the official `ruby:3.2.2-slim` image. It includes essential tools and configurations for Ruby development.

## Features
- Lightweight Ruby environment with Bundler pre-installed.
- Based on `ruby:3.2.2-slim` for a lightweight setup.
- Pre-installed essential system dependencies (`build-essential`, `libssl-dev`, etc.).
- Ready-to-use `irb` for interactive Ruby sessions.
- Ideal for development, testing, and automation workflows.

## Usage with Docker Compose

### 1. General Ruby Development
Run an interactive Ruby shell using the `ruby-base` service in the `docker-compose.yml`:
```bash
docker-compose up ruby-base --build
```

### 2. Running Ruby Scripts
Run a Ruby script in an isolated environment:
```bash
docker-compose run ruby-base ruby your_script.rb
```

### 3. Installing Gems
Install specific gems or dependencies within the container:
```bash
docker-compose run ruby-base gem install sinatra
```

### 4. Use in CI/CD Pipelines
Integrate the image into CI/CD workflows to automate Ruby testing. Example GitHub Actions snippet:
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      ruby-base:
        image: ruby-base:latest
    steps:
    - run: bundle exec rspec
```

### 5. Prototyping
Quickly prototype Ruby scripts or projects in the container:
```bash
docker-compose run ruby-base bash
```

### 6. Base for Specialized Ruby Images
Extend the base image for specific frameworks like Rails using `docker-compose` to spin up specialized services.

Example for Rails (`ruby-rails` service):
```bash
docker-compose up ruby-rails --build
```

## Shared Volume
The `shared/` directory can be used as a mounted volume at `/app` to store and access project files across services.