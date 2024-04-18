FROM denoland/deno:alpine-1.42.0

RUN printf "cd \${CODECRAFTERS_SUBMISSION_DIR} && deno cache app/main.ts && sed -i 's/^\(deno cache .*\)/#\1/' ./your_server.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh
