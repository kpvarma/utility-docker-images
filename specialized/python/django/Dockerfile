# Extend from the Python base image
FROM python-base:latest

# Set metadata
LABEL maintainer="krshnaprsad@gmail.com"
LABEL description="Specialized Python image with Django pre-installed."

# Install Django
RUN pip install django==4.2

# Set the working directory
WORKDIR /app

# Expose Django's default port
EXPOSE 8000

# Default command
CMD ["django-admin"]