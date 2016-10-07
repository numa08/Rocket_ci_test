#!/usr/bin/env bash

set -u -o -x -v -e
test -f $(which aws)
test -f $(which gcloud)
echo no | android create avd -t android-24 -n test -b armeabi-v7a -f
emulator -avd test -no-window &
wait_emulator
set +e
./gradlew assemble test connectedAndroidTest --stacktrace
code=$?
set -e
rsync -avz --exclude=tmp/ --exclude=intermediates/ --exclude='**/*.java' --exclude='**/*.class' ./app/build $ROCKET_ARTIFACTS && exit $code
