# Utility Docker Containers

Use these docker-compose.yml and respective Dockerfile to spin a utility container to initialize a new project.

# Ruby Utility

Start the ruby_utility service in a container

```
docker-compose run --rm ruby_utility new new_app
docker-compose run --rm ruby_utility new new_api --api
```

You will now see the a ruby project files created in the ruby/new_app folder


You can now move the node/new_app folder outside of this folder where ever you wish and keep developing it.

```
mv ruby/new_api ../learnings/
mv ruby/new_app ../learnings/
```

Add Dockerfile and docker-compose.yml

```
touch ruby/new_app/Dockerfile
touch ruby/new_app/docker-compose.yml
```

Copy the content below to the newly created Dockerfile
```
FROM ruby

# Update and install required dependencies
RUN apt-get update && apt-get install -y build-essential && apt-get clean

# Create a directory for the application
RUN mkdir /app
WORKDIR /app

COPY package.json /app
RUN npm install

# Expose a port
EXPOSE 8002
```

Copy the content below to the newly created Dockerfile
```
version: '3.9'
services:
  rubyjs:
    build:
      context: ./rubyjs/image
    image: new_ruby_app:latest
    container_name: new_ruby_app
    command: ["/bin/bash"]
    tty: true
    stdin_open: true
    restart: always
    env_file:
      - ./rubyjs/image/rubyjs.env
    volumes:
      - ./rubyjs/lessons:/app/lessons/
volumes:
  nodejs_lessons:
```

# Node Utility

Start the node_utility service in a container

```
docker-compose run --rm node_utility init
```

You will now see the a node project files created in the node/new_app folder

You could now install any npm you need.
for e.g to install Express.js, do like below:

```
docker-compose run --rm node_utility install express
```

Alternatively you could edit the node/new_app/package.json and add your desired dependencies and do an npm install in one go.

```
docker-compose run --rm node_utility install
```

Add Dockerfile and docker-compose.yml

```
touch node/new_app/Dockerfile
touch node/new_app/docker-compose.yml
```

Copy the content below to the newly created Dockerfile
```
FROM node

# Update and install required dependencies
RUN apt-get update && apt-get install -y build-essential && apt-get clean

# Create a directory for the application
RUN mkdir /app
WORKDIR /app

COPY package.json /app
RUN npm install

# Expose a port
EXPOSE 8002
```

Copy the content below to the newly created Dockerfile
```
version: '3.9'
services:
  nodejs:
    build:
      context: ./nodejs/image
    image: new_node_app:latest
    container_name: new_node_app
    command: ["/bin/bash"]
    tty: true
    stdin_open: true
    restart: always
    env_file:
      - ./nodejs/image/nodejs.env
    volumes:
      - ./nodejs/lessons:/app/lessons/
volumes:
  nodejs_lessons:
```

You can now move the node/new_app folder outside of this folder where ever you wish and keep developing it.