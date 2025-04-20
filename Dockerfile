# Build Caddy with the Godaddy DNS plugin
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/godaddy

# Final image
FROM caddy:2

# Copy the custom-built binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy