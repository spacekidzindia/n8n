FROM node:18-alpine

RUN apk add --no-cache \
    bash \
    curl \
    python3 \
    make \
    g++ \
    sqlite \
    openssl

WORKDIR /usr/src/app

COPY . .

RUN npm install -g pnpm && pnpm install

EXPOSE 3000

CMD ["pnpm", "start"]
