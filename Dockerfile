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

RUN npm install --legacy-peer-deps

EXPOSE 3000

CMD ["n8n"]
