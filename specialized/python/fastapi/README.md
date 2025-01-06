
# Python FastAPI Specialized Image

This is a specialized Docker image for FastAPI, built on top of the `python-base` image. It includes all the necessary dependencies for FastAPI development.

## Features
- Pre-installed FastAPI and Uvicorn.
- Ready-to-use for FastAPI projects.
- Exposes the default FastAPI server port (8000).

## Usage

### Build the Image
To build the FastAPI image locally:
```bash
docker build -t python-fastapi .
```

### Start a FastAPI Application
To run a FastAPI application:
1. Create a `main.py` file in your project directory with the following content:
   ```python
   from fastapi import FastAPI

   app = FastAPI()

   @app.get("/")
   def read_root():
       return {"message": "Hello, FastAPI!"}
   ```
2. Start the FastAPI application:
   ```bash
   docker run -it -p 8000:8000 -v "$(pwd):/app" python-fastapi uvicorn main:app --host 0.0.0.0 --port 8000
   ```

## Exposed Ports
- **8000**: Default port for the FastAPI server.

## Customization
To customize this image for specific requirements (e.g., additional Python packages), modify the `Dockerfile` and rebuild the image:
```bash
docker build -t python-fastapi .
```

## License
This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
