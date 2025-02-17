# syntax=docker/dockerfile:1.7-labs
FROM clojure:tools-deps-1.12.0.1501-bookworm

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="deps.edn"

WORKDIR /app
# COPY deps.edn ./

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN .codecrafters/compile.sh