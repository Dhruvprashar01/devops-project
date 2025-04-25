# Stage 1: Build the React app
FROM node:18-alpine as build

WORKDIR /app

# Copy all project files
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build

# Stage 2: Serve the built app
FROM node:18-alpine

# Install 'serve' to serve static files
RUN npm install -g serve

# Copy the build files from previous stage
COPY --from=build /app/build /app/build

WORKDIR /app

# Expose port 3000
EXPOSE 3000

# Start the static server
CMD ["serve", "-s", "build", "-l", "3000"]
