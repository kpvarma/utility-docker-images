
# Python Django Specialized Image

This is a specialized Docker image for Django, built on top of the `python-base` image. It includes all the necessary dependencies for Django development.

## Features
- Pre-installed Django (`v4.2`).
- Ready-to-use for Django projects.
- Exposes the default Django development server port (8000).

## Usage

### Build the Image
To build the Django image locally:
```bash
docker build -t python-django .
```

### Run a New Django Application
To create a new Django application:
```bash
docker run -it -v "$(pwd):/app" python-django django-admin startproject myproject
```

### Start an Existing Django Application
To run an existing Django application:
1. Navigate to your Django project directory:
   ```bash
   cd myproject
   ```
2. Start the Django development server:
   ```bash
   docker run -it -p 8000:8000 -v "$(pwd):/app" python-django python manage.py runserver 0.0.0.0:8000
   ```

## Exposed Ports
- **8000**: Default port for the Django development server.

## Customization
To customize this image for specific requirements (e.g., additional Python packages), modify the `Dockerfile` and rebuild the image:
```bash
docker build -t python-django .
```

## License
This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
