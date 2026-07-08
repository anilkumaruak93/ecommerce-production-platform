# ============================================================
# Stage 1: Install production dependencies
# ============================================================
FROM node:20-bookworm-slim AS dependencies

WORKDIR /app

# Required only to compile native Node.js modules such as pprof
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        make \
        g++ && \
    rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm ci --omit=dev

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM node:20-bookworm-slim AS runtime

WORKDIR /app

ENV NODE_ENV=production

COPY --from=dependencies /app/node_modules ./node_modules

COPY package.json ./
COPY index.js ./
COPY server.js ./
COPY charge.js ./
COPY logger.js ./
COPY proto ./proto

EXPOSE 50051

USER node

CMD ["node", "index.js"]