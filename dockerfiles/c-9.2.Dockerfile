FROM n0madic/alpine-gcc:9.2.0
RUN apk add --update-cache --upgrade curl
RUN apk add --update-cache --upgrade curl-dev
