# Use the official Python slim image
FROM python:3.9-slim

# Set metadata
LABEL maintainer="krshnaprsad@gmail.com"
LABEL description="Base Python image with essential tools and configurations."

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install pip and virtualenv
RUN python -m pip install --upgrade pip && pip install virtualenv

# Default command for derived images
CMD ["python"]