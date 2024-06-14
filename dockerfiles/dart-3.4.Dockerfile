FROM dart:3.4 AS build

WORKDIR /app

# Copy pubspec and resolve app dependencies.
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and ensure packages are still up-to-date if anything has changed.
COPY . .
RUN dart pub get --offline

# Set up precompilation script.
RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && dart compile exe bin/main.dart -o compiled && ./your_server.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

# Expose server.
# EXPOSE 4221
