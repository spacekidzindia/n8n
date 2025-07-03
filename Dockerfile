FROM node:18-alpine

# Install necessary dependencies
RUN apk add --no-cache \
    bash \
    curl \
    python3 \
    make \
    g++ \
    libc6-compat \
    openssl \
    sqlite \
    git \
    libstdc++ \
    libgcc

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install pnpm & dependencies
RUN corepack enable && corepack prepare pnpm@latest --activate && pnpm install

# Expose port
EXPOSE 3000

# Start n8n
CMD ["pnpm", "start"]
