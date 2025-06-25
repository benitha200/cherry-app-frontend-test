# FROM node:20-alpine

# # Add dependencies for building native modules
# RUN apk add --no-cache libc6-compat

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# EXPOSE 5173

# CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

FROM node:20-alpine AS builder

# Add dependencies for building native modules
RUN apk add --no-cache libc6-compat

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Inject build-time environment variables
ARG API_URL=http://localhost:3000/api
ENV VITE_API_URL=$API_URL

RUN npm run build

# Production stage
FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

# Add runtime configuration script
COPY runtime-env.js .
COPY .env .

EXPOSE 5173

# Use runtime configuration
CMD ["sh", "-c", "node runtime-env.js && npx vite preview --host 0.0.0.0 --port 5173"]
