FROM golang:1.21-alpine

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="go.mod,go.sum"

WORKDIR /app

COPY go.mod go.sum ./

RUN ash -c "set -exo pipefail; go mod graph | awk '{if (\$1 !~ \"@\") {print \$2}}' | xargs -r go get"

RUN mkdir /tmp/codecrafters-http-target

RUN printf "cd \${CODECRAFTERS_SUBMISSION_DIR} && go build -o /tmp/codecrafters-http-target/your_server app/*go && sed -i 's/^\(go build .*\)/#\1/' ./your_server.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh
