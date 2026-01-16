# Use the official Node.js image as the base image
FROM node:20

# Enable corepack to be able to use pnpm
RUN corepack enable

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY ../pnpm-lock.yaml ../package.json ./

# Install the application dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application files
COPY .. .

# Build the NestJS application
RUN pnpm run build

# Expose the application port
EXPOSE 3001

# Command to run the application
CMD ["node", "dist/main"]
