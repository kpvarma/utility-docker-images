
# Use the official Node.js slim image
FROM node:21-alpine

# Set metadata
LABEL maintainer="krshnaprsad@gmail.com"
LABEL description="Base Node.js image with essential tools and configurations."

# Install basic dependencies
RUN apk add --no-cache bash git curl

# Set the working directory
WORKDIR /app

# Install commonly used Node.js libraries globally
# axios                # For HTTP requests
# lodash               # For utility functions
# moment               # For date/time manipulation
# chalk                # For colorful console logs
# inquirer             # For interactive prompts in CLI tools
# commander            # For building CLI applications
# uuid                 # For generating unique IDs
RUN npm install -g axios lodash moment chalk inquirer commander uuid

# Set NODE_PATH to make globally installed packages available in the REPL
ENV NODE_PATH=/usr/local/lib/node_modules

# Default command for derived images
CMD ["node"]
