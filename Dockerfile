# Use Debian-based Node image instead of Alpine for compatibility
FROM node:18

# Install dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    python3 \
    make \
    g++ \
    openssl \
    sqlite3 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Enable and install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install Node.js dependencies using pnpm
RUN pnpm install

# Expose the port n8n runs on
EXPOSE 3000

# Start the application
CMD ["pnpm", "start"]
