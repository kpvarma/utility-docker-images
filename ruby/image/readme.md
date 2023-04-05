# Prerequisite

Clone the utility-docker-images repository 
```
git clone git@github.com:kpvarma/utility-docker-images.git
$ cd utility-docker-images
```

Build the docker image
```
$ docker-compose build ruby_utility
```

# Ruby Utility

Start the ruby_utility service in a container

```
docker-compose run --rm ruby_utility new new_app
docker-compose run --rm ruby_utility new new_api --api
```

Replace the name new_app or new_api with what you like.
You will now see the a ruby project files created in the ruby/new_app folder.
Note, you can change 


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
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
```
Copy below content to entrypoint.sh
```
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
```

Copy the content below to the newly created docker-compose.yml
```
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
  api:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/app
    ports:
      - "3000:3000"
    depends_on:
      - db
```

## Quick Start Guide

Refer the quick start guide for configuring Dockerfile and docker-compose.yml for the newly create rails api.

https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/
