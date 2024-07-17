# syntax=docker/dockerfile:1.7-labs
FROM dart:3.4

# Rebuild if these files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="pubspec.yaml,pubspec.lock"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Download dependencies
RUN dart pub get

# Once the heavy steps are done, we can copy all files back
COPY . /app
