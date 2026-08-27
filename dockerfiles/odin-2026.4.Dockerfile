# syntax=docker/dockerfile:1.7-labs
FROM silkeh/clang:21-trixie

# vendor:zlib links against system libz on Linux (gzip compression)
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /Odin-install
RUN git clone --depth 1 -b dev-2026-04 https://github.com/odin-lang/Odin.git /Odin-install \
    && git checkout dev-2026-04 \
    && make

RUN mkdir /opt/Odin \
    && cp -R ./base ./core ./shared ./vendor ./odin /opt/Odin/

WORKDIR /
RUN rm -rf /Odin-install
ENV PATH="/opt/Odin:${PATH}"

# Build vendor:zlib against libz so gzip stages can import "vendor:zlib"
RUN printf '%s\n' \
        'package main' \
        'import zlib "vendor:zlib"' \
        'main :: proc() { _ = zlib.crc32(0, nil, 0) }' \
        > /tmp/vendor_zlib.odin \
    && odin build /tmp/vendor_zlib.odin -file -out:/tmp/vendor_zlib \
    && rm -f /tmp/vendor_zlib /tmp/vendor_zlib.odin

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN .codecrafters/compile.sh
