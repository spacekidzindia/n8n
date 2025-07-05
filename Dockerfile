FROM node:18

# Install deps
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

# Install pnpm globally
RUN npm install -g pnpm

# Set working dir
WORKDIR /app

# Copy project files
COPY . .

# Install Node.js deps
RUN pnpm install --no-frozen-lockfile

# Expose port
EXPOSE 3000

# Start app
CMD ["pnpm", "start"]
