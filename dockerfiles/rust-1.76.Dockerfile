FROM rust:1.76-buster

COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-http-server-target

RUN cargo clean -p http-server-starter-rust --release --target-dir=/tmp/codecrafters-http-server-target

RUN rm -rf /app/src

RUN echo "cd \${CODECRAFTERS_REPOSITORY_DIR} && cargo build --release --target-dir=/tmp/codecrafters-http-server-target --manifest-path Cargo.toml" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Cargo.toml,Cargo.lock"
