#!/usr/bin/env bash

set -u -o -x -v -e
test -f $(which aws)
test -f $(which gcloud)
env
echo "hello"
set +e
./gradlew assemble test --stacktrace
code=$?
set -e
rsync -avz --exclude=tmp/ --exclude=intermediates/ --exclude='**/*.java' --exclude='**/*.class' ./app/build $ROCKET_ARTIFACTS && exit $code
