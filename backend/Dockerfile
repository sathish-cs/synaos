# Image 
FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .


# Image
FROM node:16-slim

# Create app directory
WORKDIR /app

# Copy code from previous build
COPY --from=0 /usr/src/app ./

# Create user and group
RUN  useradd --user-group --system --create-home --no-log-init app

# App port
EXPOSE 8000

# Run as user app
USER app
CMD [ "node", "server.js" ]

