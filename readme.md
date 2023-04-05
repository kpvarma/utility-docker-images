# Utility Docker Containers

The utility container provides a space where miscellaneous tools and other software can be installed. Tools and objects can be placed in a utility container if they do not require a dedicated container or if it is impractical to create a new container for a single tool or object.

In Practice, you can do docker pull <utility-image> and run the utility within this container without requiring to install it in your system. This repo contains utility docker image for running nodejs and rails utilities.

## Usage

Use the docker-compose.yml and respective Dockerfile to spin a utility container to initialize a new project.

There are utility for node and rails-api
For rails, go to Dockerfile and uncomment the rails section and comment the rails-api like below:

```
# Install Rails API
# RUN gem install rails-api
# ENTRYPOINT ["rails-api"]

# Install Rails
RUN gem install rails
ENTRYPOINT ["rails"]
```

## Node Utility

[Read More](node/image/readme.md)

## Ruby Utility

[Read More](ruby/image/readme.md)

## Contributing

Build the Docker image using the following command:
```
docker build -t kpvarma/node_utility node/image
docker build -t kpvarma/ruby_utility ruby/image
```


