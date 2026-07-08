# ============================================================
# Stage 1: Install production dependencies
# ============================================================
FROM node:20-bookworm-slim AS dependencies

WORKDIR /app

# Native npm dependencies such as pprof need build tools.
# These tools exist only in this build stage.
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
COPY server.js ./
COPY data ./data
COPY proto ./proto

EXPOSE 7000

USER node

CMD ["node", "server.js"]