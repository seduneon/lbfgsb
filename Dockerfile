FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG FPM_VERSION=0.12.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    gfortran make git curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install fpm (Linux x86_64 binary from the release assets)
RUN set -eux; \
    curl -L -o /usr/local/bin/fpm \
      "https://github.com/fortran-lang/fpm/releases/download/v${FPM_VERSION}/fpm-${FPM_VERSION}-linux-x86_64-gcc-12"; \
    chmod +x /usr/local/bin/fpm; \
    fpm --version

