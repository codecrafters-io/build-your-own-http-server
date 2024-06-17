# syntax=docker/dockerfile:1.7-labs
FROM dart:3.4

# Rebuild if these files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="pubspec.yaml"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Download dependencies
RUN dart pub get

# Set up precompilation script.
RUN printf "cd \${CODECRAFTERS_SUBMISSION_DIR} && dart compile exe bin/main.dart -o compiled && sed -i 's/^\(dart .*\)/#\1/' ./your_server.sh && chmod +x ./your_server.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="vcpkg.json,vcpkg-configuration.json"

# Once the heavy steps are done, we can copy all files back
COPY . /app
