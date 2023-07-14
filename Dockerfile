# Production Dockerfile
FROM node:16-alpine

WORKDIR /app

# Copy package.json and package-lock.json files first
COPY package*.json ./

# Install dependencies
RUN npm install

COPY . .

# Build application
RUN npm run build

RUN sudo chown -R 1011030000:0 "/.npm"

# Run the server in production mode
CMD npm run server:prod

# Remove source code from production image
RUN rm -Rf src

EXPOSE 8080 