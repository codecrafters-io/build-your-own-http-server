FROM haskell:9.10-bookworm

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        pkg-config \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="stack.yaml,package.yaml,stack.yaml.lock"

RUN mkdir -p /etc/stack

# Absence of this causes `stack run` to raise a permissions error
RUN echo "allow-different-user: true" >> /etc/stack/config.yaml

# Force usage of the system GHC installation
RUN echo "install-ghc: false" >> /etc/stack/config.yaml
RUN echo "system-ghc: true" >> /etc/stack/config.yaml

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY . /app/
RUN rm -rf /app/.git /app/README.md

ENV STACK_ROOT=/app/.stack
RUN stack build
RUN stack clean codecrafters-http-server

RUN mkdir /app-cached
RUN mv .stack-work /app-cached/.stack-work
RUN mv .stack /app-cached/.stack
RUN rm -rf /app/app
