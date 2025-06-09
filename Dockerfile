# # Base image
# FROM node:20-alpine

# # Set working directory
# WORKDIR /app

# # Copy package files
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy project files
# COPY . .

# # Build the app
# RUN npm run build

# # Expose port
# EXPOSE 5173

# # Command to run the app
# CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

# Use the official lightweight Node.js 20 Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies (including devDependencies for build)
RUN npm ci

# Copy project files
COPY . .

# Build the app
RUN npm run build

# Expose port (Vite dev server default port)
EXPOSE 5173

# Command to run the app in development mode
# Note: For production, consider using a proper web server like nginx
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]