FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    openssl \
    curl \
    iproute2 \
    coreutils \
    bash \
    ca-certificates \
 && ln -sf /usr/bin/python3 /usr/bin/python \
 && rm -rf /var/lib/apt/lists/*

COPY package.json ./
RUN npm install --omit=dev

COPY . .

RUN chmod +x index.js

EXPOSE 3000/tcp

CMD ["node", "index.js"]
