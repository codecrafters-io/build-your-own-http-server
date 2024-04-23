FROM denoland/deno:alpine-1.42.0

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="package.json"

WORKDIR /app

COPY package.json ./
COPY app/ ./app/
RUN deno cache app/main.ts 
RUN rm -rf ./app/

RUN mkdir -p /app-cached
RUN if [ -d "/app/node_modules" ]; then mv /app/node_modules /app-cached; fi

RUN printf "cd \${CODECRAFTERS_SUBMISSION_DIR} && deno cache app/main.ts" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh
