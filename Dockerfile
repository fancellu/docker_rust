FROM rust:alpine as builder

WORKDIR /usr/src/docker-rust
COPY . .
RUN cargo install --path .

FROM alpine:latest
# RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/docker-rust /usr/local/bin/docker-rust
CMD ["docker-rust"]