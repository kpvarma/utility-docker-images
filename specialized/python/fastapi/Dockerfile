# Extend from the Python base image
FROM python-base:latest

# Set metadata
LABEL maintainer="krshnaprsad@gmail.com"
LABEL description="Specialized Python image with FastAPI pre-installed."

# Install FastAPI and Uvicorn
RUN pip install fastapi uvicorn

# Set the working directory
WORKDIR /app

# Expose FastAPI's default port
EXPOSE 8000

# Default command to start the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]