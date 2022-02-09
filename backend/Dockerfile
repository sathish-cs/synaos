FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

#CMD [ "node", "server.js" ]


FROM node:16-slim
WORKDIR /app
COPY --from=0 /usr/src/app ./
RUN  useradd --user-group --system --create-home --no-log-init app
EXPOSE 8000
USER app
CMD [ "node", "server.js" ]

