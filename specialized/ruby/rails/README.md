
# Ruby on Rails Specialized Image

This is a specialized Docker image for Ruby on Rails, built on top of the `ruby-base` image. It includes all the necessary dependencies for developing and running Rails applications.

## Features
- Pre-installed Ruby on Rails (`v7.0.4`).
- Includes JavaScript runtime dependencies (`nodejs`, `npm`, `yarn`).
- Default Rails server configuration to run on `0.0.0.0:3000`.
- Lightweight and ready-to-use for Rails projects.

## Usage

### Build the Image
To build the Rails image locally:
```bash
docker build -t ruby-rails .
```

### Run a New Rails Application
To create a new Rails application:
```bash
docker run -it -v "$(pwd):/app" ruby-rails rails new myapp --skip-bundle
```

### Start an Existing Rails Application
To run an existing Rails application:
1. Navigate to your Rails project directory:
   ```bash
   cd myapp
   ```
2. Start the Rails server:
   ```bash
   docker run -it -p 3000:3000 -v "$(pwd):/app" ruby-rails
   ```

### Running Rails Commands
You can execute Rails commands directly within the container:
```bash
docker run -it -v "$(pwd):/app" ruby-rails rails db:migrate
```

### Debugging
To open an interactive shell in the container for debugging:
```bash
docker run -it --entrypoint=bash ruby-rails
```

## Exposed Ports
- **3000**: Default port for the Rails development server.

## Customization
To customize this image for specific requirements (e.g., additional gems or dependencies), modify the `Dockerfile` and rebuild the image:
```bash
docker build -t ruby-rails .
```

## Example Docker Compose
To simplify development with databases and other services, use Docker Compose. Here's an example `docker-compose.yml`:
```yaml
version: '3.8'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/app
    depends_on:
      - db
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"
```

## License
This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
