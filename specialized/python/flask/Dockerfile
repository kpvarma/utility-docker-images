# Extend from the Python base image
FROM python-base:latest

# Set metadata
LABEL maintainer="krshnaprsad@gmail.com"
LABEL description="Specialized Python image with Flask pre-installed."

# Install Flask
RUN pip install flask==2.3.2

# Set the working directory
WORKDIR /app

# Expose Flask's default port
EXPOSE 5000

# Default command
CMD ["flask", "run", "--host=0.0.0.0"]