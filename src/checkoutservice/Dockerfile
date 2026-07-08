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
    -o /app/checkoutservice \
    .

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM gcr.io/distroless/static-debian12:nonroot AS runtime

WORKDIR /app

COPY --from=builder /app/checkoutservice /app/checkoutservice

EXPOSE 5050

USER nonroot:nonroot

ENTRYPOINT ["/app/checkoutservice"]