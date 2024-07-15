#!/bin/sh
#
# This script is used to run your program on CodeCrafters
#
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

exec java -jar /tmp/codecrafters-build-http-server-kotlin/build-your-own-http-server.jar "$@"
