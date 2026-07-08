# ============================================================
# Stage 1: Build the Go application
# ============================================================
FROM golang:1.25 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build \
    -trimpath \
    -ldflags="-s -w" \
    -o /app/frontend \
    .

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM gcr.io/distroless/static-debian12:nonroot AS runtime

WORKDIR /app

COPY --from=builder /app/frontend /app/frontend
COPY --from=builder /app/static /app/static
COPY --from=builder /app/templates /app/templates

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app/frontend"]