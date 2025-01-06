
# Python Flask Specialized Image

This is a specialized Docker image for Flask, built on top of the `python-base` image. It includes all the necessary dependencies for Flask development.

## Features
- Pre-installed Flask (`v2.3.2`).
- Ready-to-use for Flask projects.
- Exposes the default Flask development server port (5000).

## Usage

### Build the Image
To build the Flask image locally:
```bash
docker build -t python-flask .
```

### Start a Flask Application
To run a Flask application:
1. Navigate to your Flask project directory.
2. Start the Flask development server:
   ```bash
   docker run -it -p 5000:5000 -v "$(pwd):/app" python-flask flask run --host=0.0.0.0
   ```

### Exposed Ports
- **5000**: Default port for the Flask development server.

## Customization
To customize this image for specific requirements (e.g., additional Python packages), modify the `Dockerfile` and rebuild the image:
```bash
docker build -t python-flask .
```

## License
This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
