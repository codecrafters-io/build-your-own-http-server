#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
go build -o "/tmp/codecrafters-http-target/your_server" app/*.go
exec "/tmp/codecrafters-http-target/your_server" "$@"
