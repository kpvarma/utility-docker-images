FROM ruby:3.2.2

# Update and install required dependencies
RUN apt-get update && apt-get install -y build-essential && apt-get clean

# Create a directory for the application
# RUN mkdir /app
WORKDIR /app

# Install required gems
RUN gem install bundler

# Install Rails
RUN gem install rails -v 8.0.1
ENTRYPOINT ["rails"] 

# Expose a port
# EXPOSE 8001