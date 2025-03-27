
# Ruby Base Docker Image

This is a base Docker image for Ruby projects, built on top of the official `ruby:3.2.2-slim` image. It includes essential tools and configurations for Ruby development.

## Features
- Lightweight Ruby environment based on `ruby:3.2.2-slim`.
- Pre-installed essential system dependencies (`build-essential`, `curl`, `git`, etc.).
- Bundler pre-installed globally for managing Ruby gems.
- Ideal for developing, testing, and prototyping Ruby applications in a clean and isolated environment.

## Build the ruby-base Image

To build the Ruby base image, run:
```bash
docker compose build ruby-base
```

## Practical Use Cases

### Start an interactive session with IRB:

Start an interactive session in the container to experiment with Ruby code or test new gems:
```bash
docker compose run --rm ruby-base irb
```

1. Install a gem temporarily:
   ```ruby
   require 'date'
   puts Date.today
   ```

2. Write and test a quick Ruby script:
   ```ruby
   File.write("hello.rb", 'puts "Hello, Ruby!"')
   system("ruby hello.rb")
   ```

3. Test and Debug Ruby Code Snippets:
   Quickly evaluate Ruby expressions or test simple snippets:
   ```ruby
   puts "Hello, Ruby!"
   2 + 3
   [1, 2, 3].map { |n| n * 2 }
   ```

4. Explore Ruby Gems:
   Experiment with Ruby gems before adding them to your project:
   ```ruby
   require 'securerandom'
   puts SecureRandom.hex(10)

   require 'json'
   puts JSON.generate({ name: "Ruby", version: "3.2.2" })
   ```

5. Prototype Small Ideas:
   Validate Ruby methods or blocks before integrating them into your app:
   ```ruby
   def greet(name)
     "Hello, #{name}!"
   end
   puts greet("World")
   ```

---

### 2. Run Ruby Scripts

To execute Ruby scripts stored on your local machine, place the script in the shared directory and specify the file to run:
```bash
# Example: Running a script located in the `shared/scripts` folder.
docker compose run --rm ruby-base ruby /app/scripts/my_script.rb
```

---

### 3. Create a New Ruby Project
Use this image to scaffold a new Ruby project or work on an existing one:
1. **Initialize a New Ruby Project**:
   ```bash
   docker compose run --rm ruby-base bundle init
   ```

2. **Install Dependencies**:
   Add dependencies to the `Gemfile`, then install them:
   ```bash
   docker compose run --rm ruby-base bundle install
   ```

3. **Run the Application**:
   ```bash
   docker compose run --rm ruby-base ruby your_app.rb
   ```

---

### 4. Create a Ruby Gem

Use this image to scaffold and develop a new Ruby gem:

1. **Scaffold a New Gem**:
   Run the following command to create a new Ruby gem structure:
   ```bash
   docker compose run --rm ruby-base bundle gem my_gem
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

### Conclusion
This Ruby base image provides a clean, isolated, and versatile environment for Ruby development. Whether you're prototyping, building a new project, or running tests, this image simplifies your workflow and keeps your host system clean.

### Shared Volume
By default, you can use the `shared/` directory as a mounted volume to store and access project files across services.
