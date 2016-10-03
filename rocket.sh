#!/usr/bin/env bash

set -u -o -x -v -e
test -f $(witch aws)
test -f $(which gcloud)
./gradlew assemble --stacktrace 
