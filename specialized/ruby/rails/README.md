
# Ruby on Rails Docker Image

This is a specialized Docker image for Ruby on Rails development, built on top of the official `ruby:3.2.2` image. It includes essential tools and configurations for developing, testing, and running Rails applications. With `bundler` and `Rails 8.0.1` pre-installed, this image provides a ready-to-use environment for Rails developers, reducing setup time and ensuring consistency.

---

## Features
- **Base Image**: Built on the lightweight and reliable `ruby:3.2.2` image.
- **Bundler Pre-installed**: Simplifies managing Ruby gems, saving time during setup.
- **Rails 8.0.1**: Ready for developing modern Rails applications with the latest features and updates.
- **Development Tools**: Includes essential packages like `build-essential` for compiling native gems and other dependencies.
- **Streamlined Workflows**: Configured to use Rails as the default command, making common tasks like scaffolding and running servers more straightforward.

---

## Build the Rails Image

To build the Rails image, navigate to the project root directory where the `docker compose.yml` file is located and run:
```bash
docker compose build ruby-rails
```
This command uses the Dockerfile to create the Rails image, pulling in the necessary dependencies and configurations.

---

## Practical Usages

### **1. Create a New Rails Application**

You can quickly scaffold a new Rails application using this image, avoiding the need to install Rails locally. Here's how:

1. Create a directory to hold your projects:
   ```bash
   mkdir projects/
   cd projects/
   ```

2. Set the current directory as the project directory:
   ```bash
   export PROJECT_DIR=$PWD
   ```

3. Use the Docker image to scaffold a new Rails application:
   ```bash
   docker compose run --rm ruby-rails new my_rails_app
   ```
   This creates a new Rails application in the `my_rails_app` directory. All files are generated in the host system directory, ensuring easy access and editing.

## 2. Create a Ruby Gem

Use this image to scaffold and develop a new Ruby gem:

1. **Scaffold a New Gem**:
   Run the following command to create a new Ruby gem structure:
   ```bash
   docker compose rails plugin new my_gem --mountable
   # docker compose rails plugin new devise_crud --mountable

   ```

2. **Navigate to the Gem Directory**:
   Change into the newly created gem's directory:
   ```bash
   cd projects/my_gem # projects is pwd
   export PROJECT_DIR=$PWD # making the new gem directory the PROJECT_DIR 
   ```

   <strong>Reminder: Update Your Gemspec File</strong>

   After generating a new gem, ensure you update the `.gemspec` file with valid metadata. 
   Replace placeholders like `TODO: Put your gem's website or public repo URL here` in fields such as `spec.metadata['homepage_uri']` with a valid URL or remove the line if not applicable. 
   This step is necessary to avoid errors during `bundle install` or gem building.

3. **Install Development Dependencies**:
   Run `bundle install` to install the necessary dependencies for your gem:
   ```bash
   docker compose run --rm ruby-base bundle install
   ```

4. **Write Code and Tests**:
   - Add your gem's functionality in the `lib/my_gem.rb` file.
   - Write tests in the `spec` directory.

5. **Run Tests**:
   Use `rspec` to test your gem:
   ```bash
   docker compose run --rm ruby-base rspec
   ```

6. **Build the Gem**:
   Build the gem package to ensure it’s ready for distribution:
   ```bash
   docker compose run --rm ruby-base gem build my_gem.gemspec
   ```

7. **Install the Gem Locally**:
   Test your gem locally by installing it:
   ```bash
   docker compose run --rm ruby-base gem install my_gem-0.1.0.gem
   ```

8. **Publish the Gem** *(Optional)*:
   Push your gem to [RubyGems](https://rubygems.org/) (requires an account and API key):
   ```bash
   docker compose run --rm ruby-base gem push my_gem-0.1.0.gem
   ```

---

### **2. Run the Rails Development Server**

#### **Navigate to Your App Directory**
Move into the directory where your Rails application was created:
```bash
cd my_rails_app
```

#### **Set the Application Directory**
Set the `APP_DIR` environment variable to your application's root:
```bash
export APP_DIR=$PWD
```

#### **Start the Rails Server**
Run the development server using the Rails image:
```bash
docker compose run --rm --service-ports ruby-rails server
```
The `--service-ports` flag ensures that the container's ports are mapped to your host machine, making the application accessible.

Once started, your Rails app will be available at [http://localhost:3000](http://localhost:3000).

---

### **3. Set Up Dockerfile and Docker Compose for the Rails App**

#### **Prepare Your App for Docker**
Run the provided script to set up a dedicated Dockerfile and `docker compose.yml` for your new Rails application. This ensures that the app can run independently with its own configurations:
1. Ensure you are in the `utility-docker-images` root directory.
2. Grant execution permissions to the setup script:
   ```bash
   chmod +x utils/setup-docker.sh
   ```

3. Run the script to copy the Dockerfile and `docker compose.yml` into your app directory:
   ```bash
   ./utils/setup-docker.sh rails
   ```

This step prepares your Rails app to run with a new Docker setup.

---

### **4. Run the New Rails App**

#### **Review Configuration**
Before building and running the Rails app, review the `docker compose.yml` file in the app directory. Configure database credentials to match your preferred database service (e.g., MySQL, PostgreSQL).

#### **Build and Start the App**
1. Build the Docker image for your Rails app:
   ```bash
   docker compose build
   ```

2. Start the application in detached mode:
   ```bash
   docker compose up -d
   ```

#### **Access the App**
The Rails application will be accessible at [http://localhost:3000](http://localhost:3000).

# Suggestions for Additions

If you'd like to enhance your Rails development workflow with this Docker setup, consider adding the following:

## 1. Testing with RSpec or MiniTest
You can easily run tests for your Rails application using this Docker setup. Here’s how:

### Running RSpec Tests
1. Add RSpec to your Rails application:
   ```bash
   docker compose run --rm ruby-rails bundle add rspec-rails --group="development, test"
   docker compose run --rm ruby-rails rails generate rspec:install
   ```

2. Run your test suite:
   ```bash
   docker compose run --rm ruby-rails bundle exec rspec
   ```

### Running MiniTest (Default for Rails)
If you are using MiniTest (the default testing framework for Rails), run your tests as follows:
```bash
docker compose run --rm ruby-rails bundle exec rake test
```

---

## 2. Connecting to a Database
This Docker setup can be easily configured to work with MySQL or PostgreSQL. Here’s how:

### MySQL Configuration
Ensure your `docker compose.yml` file has a MySQL service configured like this:
```yaml
services:
  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: rails_db
      MYSQL_USER: rails_user
      MYSQL_PASSWORD: password
    ports:
      - "3306:3306"
```

Update your `config/database.yml` file to match this setup:
```yaml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: rails_user
  password: password
  host: mysql

development:
  <<: *default
  database: rails_db

test:
  <<: *default
  database: rails_db_test
```

### PostgreSQL Configuration
Similarly, configure a PostgreSQL service in `docker compose.yml`:
```yaml
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: rails_user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: rails_db
    ports:
      - "5432:5432"
```

And update your `config/database.yml` file for PostgreSQL:
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: rails_user
  password: password
  host: postgres

development:
  <<: *default
  database: rails_db

test:
  <<: *default
  database: rails_db_test
```

With these additions, you can seamlessly test your Rails applications and connect them to your preferred database service, making your development workflow even more efficient.

---

## Conclusion

The `ruby-rails` Docker image provides a streamlined and containerized environment for Rails development. By leveraging this image, you can:
- Quickly scaffold new Rails applications.
- Simplify server setup and dependency management.
- Easily switch between multiple Rails projects without affecting your local environment.

This setup eliminates the complexities of local installations, letting you focus entirely on building your application.
