
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
docker-compose build ruby-base
```

## Practical Use Cases

### Start an interactive session with IRB:

Start an interactive session in the container to experiment with Ruby code or test new gems
```bash
docker-compose run ruby-base irb
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
   Quickly evaluate Ruby expressions or test simple snippets.
   ```ruby
   puts "Hello, Ruby!"
   2 + 3
   [1, 2, 3].map { |n| n * 2 }
   ```

4. Explore Ruby Gems:
   Experiment with Ruby gems before adding them to your project.
   ```ruby
   require 'securerandom'
   puts SecureRandom.hex(10)

   require 'json'
   puts JSON.generate({ name: "Ruby", version: "3.2.2" })
   ```

5. Prototype Small Ideas:
   Validate Ruby methods or blocks before integrating them into your app.
   ```ruby
   def greet(name)
     "Hello, #{name}!"
   end
   puts greet("World")
   ```

---

### 2. Running Ruby Scripts

To execute Ruby scripts stored on your local machine, mount the directory containing the script and specify the file to run:
```bash
# Example: Running a script located in the `scripts` folder.
docker-compose run -v "$(pwd):/app" ruby-base ruby /app/scripts/my_script.rb
```

---

### 3. Creating a New Ruby Project
Use this image to scaffold a new Ruby project or work on an existing one:
1. **Initialize a New Ruby Project**:
   ```bash
   docker-compose run -v "$(pwd):/app" ruby-base bundle init
   ```

2. **Install Dependencies**:
   Add dependencies to the `Gemfile`, then install them:
   ```bash
   docker-compose run -v "$(pwd):/app" ruby-base bundle install
   ```

3. **Run the Application**:
   ```bash
   docker-compose run -v "$(pwd):/app" ruby-base ruby your_app.rb
   ```

---

### Conclusion
This Ruby base image provides a clean, isolated, and versatile environment for Ruby development. Whether you're prototyping, building a new project, or running tests, this image simplifies your workflow and keeps your host system clean.

### Shared Volume
By default, you can use the `shared/` directory as a mounted volume to store and access project files across services.
