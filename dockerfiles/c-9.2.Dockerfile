FROM n0madic/alpine-gcc:9.2.0
RUN apk add --no-cache --upgrade 'curl>=7.66'
RUN apk add --no-cache --upgrade 'curl-dev>=7.66'
