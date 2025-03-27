
# Ruby on Rails Base Image

This is a base Docker image for Ruby on Rails projects, built on top of the `ruby:3.2.2` image. It provides a clean and isolated environment for Rails development.

## Features
- Built on `ruby:3.2.2` with essential dependencies installed.
- Includes Rails version 8.0.1 pre-installed.
- Suitable for creating, testing, and running Rails applications.
- Optimized for ease of use in development and CI/CD pipelines.

## Build the ruby-rails Image

To build the Ruby on Rails base image, run:
```bash
docker compose build ruby-rails
```

---

## Practical Use Cases

### 1. Create a New Rails Application

You can quickly scaffold a new Rails application using this image, avoiding the need to install Rails locally. Here's how:

1. **Create a directory to hold your projects**:
   ```bash
   mkdir projects/
   cd projects/
   ```

2. **Set the current directory as the project directory**:
   ```bash
   export PROJECT_DIR=$PWD
   ```

3. **Create a New Rails App**:
   ```bash
   docker compose run --rm ruby-rails rails new my_rails_app
   ```

4. **Navigate to the App Directory**:
   ```bash
   cd my_rails_app
   ```

5. **Install Dependencies**:
   Run `bundle install` to install required gems:
   ```bash
   docker compose run --rm ruby-rails bundle install
   ```

6. **Start the Rails Server**:
   Copy the dockerfile and docker-compose.yml as shown below and use that docker image to run the rails server

---

### 2. Create a Rails Gem

Use this image to scaffold and develop a new Rails gem:

1. **Create a directory to hold your projects**:
   ```bash
   mkdir projects/
   cd projects/
   ```

2. **Set the current directory as the project directory**:
   ```bash
   export PROJECT_DIR=$PWD
   echo $PROJECT_DIR # check if its set correctly
   ```

3. **Scaffold a New Gem**:
   ```bash
   docker compose run --rm ruby-rails rails plugin new my_rails_gem --mountable
   ```

4. **Navigate to the Gem Directory**:
   ```bash
   cd my_rails_gem
   ```

5. **Install Development Dependencies**:
   ```bash
   docker compose run --rm ruby-rails bundle install
   ```

6. **Run Tests**:
   Use `rspec` or any testing framework of your choice:
   ```bash
   docker compose run --rm ruby-rails rspec
   ```

5. **Build the Gem**:
   ```bash
   docker compose run --rm ruby-rails gem build my_rails_gem.gemspec
   ```

6. **Install the Gem Locally**:
   ```bash
   docker compose run --rm ruby-rails gem install my_rails_gem-0.1.0.gem
   ```

7. **Publish the Gem** *(Optional)*:
   ```bash
   docker compose run --rm ruby-rails gem push my_rails_gem-0.1.0.gem
   ```

---

### 3. Running Rails Commands

Run any Rails command using the `ruby-rails` service.

1. **Generate Scaffolding**:
   ```bash
   docker compose run --rm ruby-rails rails generate scaffold Post title:string content:text
   ```

2. **Run Migrations**:
   ```bash
   docker compose run --rm ruby-rails rails db:migrate
   ```

3. **Run Tests**:
   ```bash
   docker compose run --rm ruby-rails rails test
   ```

4. **Start a Rails Console**:
   ```bash
   docker compose run --rm ruby-rails rails console
   ```

---

## Prepare Your App for Docker

Run the provided script to set up a dedicated Dockerfile and `docker compose.yml` for your new Rails application. This ensures that the app can run independently with its own configurations:

1. Ensure you are in the `utility-docker-images` root directory.
2. Grant execution permissions to the setup script:
   ```bash
   chmod +x utils/setup-docker.sh rails
   ```

3. Run the script to copy the Dockerfile and `docker compose.yml` into your app directory:
   ```bash
   ./utils/setup-docker.sh rails
   ```

This step prepares your Rails app to run with a new Docker setup.

---

## Conclusion

The Ruby on Rails base image provides a consistent and versatile environment for Rails development. Whether you are starting a new project, building a gem, or working on an existing application, this image simplifies your workflow and keeps your host system clean.
