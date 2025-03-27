
# Node.js Base Image

This is a base Docker image for Node.js projects, built on top of the official `node:xx-alpine` images. It includes essential tools and configurations for Node.js development.

Visit https://hub.docker.com/_/node to view list of all official node docker images.

## Features
- Lightweight Node.js environment with npm pre-installed.
- Based on `node:xx-alpine` for a lightweight setup, where `xx` is the a stable node.js version.
- Pre-installed essential system dependencies (`bash`, `git`, `curl`).
- Ready for use as a base image for Node.js projects or specialized images.
- Ideal for development, testing, and automation workflows.

## Build the node-xx-base image with docker

```bash

docker build -f base/node/node-21.dockerfile -t node-21-base .
docker build -f base/node/node-22.dockerfile -t node-22-base .
docker build -f base/node/node-23.dockerfile -t node-23-base .

# or 
cd base/node
docker build -f node-21.dockerfile -t node-21-base .
docker build -f node-22.dockerfile -t node-22-base .
docker build -f node-23.dockerfile -t node-23-base .

```

## Usage with Docker Compose

### 1. Create Apps

```bash
# Create a projects directory. Navigate to this project directory. The apps will be created in this projects directory 
mkdir projects/
cd projects/ 

# Set the PROJECT_DIR environment variable to the path of your script (PWD: Present Working Directory, in this case)
export PROJECT_DIR=$PWD

# Generate an Express App
docker compose run --rm node-base npx express-generator express-app

# Generate a react.js app
docker compose run --rm node-base npx create-react-app react-app

# Generate a vue.js app
docker compose run --rm node-base npx @vue/cli create vue-app

# Generate a next.js app
docker compose run --rm node-base npx create-next-app@latest next-app

# Generate a nuxt.js app
docker compose run --rm node-base npx create-nuxt-app nuxt-app
```

Review the docker-compose.yml in the root folder and feel free to modify the node.js version in the node-base service. 
You might see something like below:
```
node-base:
    build:
      context: ./base/node
      dockerfile: node-xx.dockerfile
    image: node-base:latest
    container_name: node-base
    command: ["node"]
    volumes:
      - ${PROJECT_DIR:-./shared}:/app
    env_file:
      - ./base/node/node.env
    tty: true
```

modify the node-xx to the required version you need.

### 2. Create React Native App

Run the provided script to set up a dedicated Dockerfile and `docker compose.yml` for your new Rails application. This ensures that the app can run independently with its own configurations:

1. Generate a react native app
  ```bash
  docker compose run --rm node-base npx @react-native-community/cli init ReactNativeApp
  ```
2. Grant execution permissions to the setup script:
  ```bash
  chmod +x utils/setup-docker.sh
  ```

3. Run the script to copy the Dockerfile and `docker compose.yml` into your app directory:
  ```bash
  ./utils/setup-docker.sh react-native
  ```

This step prepares your react native app to run with a new Docker setup.
---

### 3. General Node.js Development

```bash
docker compose run --rm node-base
```

Practical Use Cases of Running Node.js in a Terminal includes:
#### 1. Test and Debug JavaScript Snippets
Quickly test small blocks of JavaScript code without creating a file.
Example:
```bash
const nums = [1, 2, 3];
nums.map(n => n * 2) // Output: [2, 4, 6]
```

#### 2. Explore Libraries and APIs
Experiment with Node.js modules or external libraries before integrating them into your project.
Example:
```bash
const axios = require('axios');

let response = await axios.get('https://jsonplaceholder.typicode.com/posts/1');
response.data

// Fetch a random cat fact
response = await axios.get('https://catfact.ninja/fact');
response.data
```

#### 3. Prove Concepts or Ideas Quickly
Before writing a full script, validate the logic in the REPL.
Example:
```bash
const isEven = num => num % 2 === 0;
isEven(4)
console.log(isEven(4)); // true
isEven(5)
console.log(isEven(5)); // false
```

### 4. Running your JavaScript Files

To run your JavaScript file in an isolated environment, you need the flexibility to run scripts from various folders without modifying the docker compose.yml file each time, a good approach is to use Docker volumes. By default, you can mount the current working directory into the container at runtime. This ensures that the container has access to the scripts or files you need, regardless of where they are located on your host machine.

Use the -v flag with docker compose run --rm to dynamically mount the directory containing your script into the container.

Here’s how you can run your utils/test_script.js:

```bash
# Navigate to your project directory:
cd utils/ 

# Set the PROJECT_DIR environment variable to the path of your script (PWD: Present Working Directory, in this case)
export PROJECT_DIR=$PWD

# Run the script
docker compose run --rm node-base node test_script.js
```

### 5. Use in CI/CD Pipelines

Integrating the node-23-base image into CI/CD pipelines ensures:

* Consistency: Tests are executed in an environment identical to production.
* Isolation: The Node.js runtime and dependencies are isolated from the host machine, avoiding “it works on my machine” issues.
* Automation: Automated testing, linting, and builds can run efficiently without requiring manual setup.

#### Example Scenario:

A development team automates testing for a Node.js application:

* The node-xx-base container is started in a CI tool like GitHub Actions.
* The container runs npm test to execute unit tests.
* Test results are reported, and if successful, the pipeline proceeds to deploy the application.

Pipeline Snippet:

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      node-base:
        image: node-23-base:latest
    steps:
    - run: npm test
```

### 6. Prototyping

Prototyping with the node-xx-base image allows:
	* Quick experimentation with new ideas or features in a clean Node.js environment.
	* Testing of small scripts, APIs, or application components without affecting the host system.
	* On-demand access to a Node.js environment without the need for local installation.

#### Example Scenario:

A developer prototypes a simple Express.js server:
1. Start the container:
```bash
docker compose run --rm node-base bash
```

2. Write and run a quick Express.js server:
```bash
npm install express
echo "const express = require('express'); const app = express(); app.get('/', (req, res) => res.send('Hello!')); app.listen(3000);" > server.js
node server.js
```

This allows the developer to quickly prototype and validate ideas without setting up a full project or environment locally.

## Conclusion

These features make the node-xx-base image versatile for tasks ranging from small-scale experiments to large-scale automated pipelines, providing a consistent and isolated Node.js environment that can adapt to a wide range of development needs.

## Shared Volume
The `shared/` directory can be used as a mounted volume at `/app` to store and access project files across services.