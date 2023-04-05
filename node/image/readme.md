# Prerequisite

Clone the utility-docker-images repository 
```
git clone git@github.com:kpvarma/utility-docker-images.git
$ cd utility-docker-images
```

Build the docker image
```
$ docker-compose build node_utility
```

# Node Utility

Start the node_utility service in a container

```
$ docker-compose run --rm node_utility init
```

You will now see the node project files created in the node/new_app folder

You could now install any npm you need. what ever you type after node_utility is passed as the argument to the npm command running inside the docker utility container. Check the CMD command in Dockerfile to learn how this is done.

```
# for e.g to install Express.js, do like below:
$ docker-compose run --rm node_utility install express

# Install multiple libraries
$ docker-compose run --rm node_utility install mongoose nodemon dotenv
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

```
$ mv node/new_app ~/Projects/2023/new_project_name
```