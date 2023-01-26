FROM ruby

# Update and install required dependencies
RUN apt-get update && apt-get install -y build-essential && apt-get clean

# Create a directory for the application
RUN mkdir /app
WORKDIR /app

# Install required gems
RUN gem install bundler
RUN gem install rails
RUN gem install rails-api

ENTRYPOINT ["rails"]

# Expose a port
EXPOSE 8001