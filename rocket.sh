#!/usr/bin/env bash
env
#set -u -x -v -e
mkdir -p "${HOME}/.gradle"
if [[ -d $ROCKET_CACHE/.gradle ]];then
    cp -r $ROCKET_CACHE/.gradle $HOME
fi    
test -f $(which aws)
test -f $(which gcloud)
set +e
./gradlew assemble test --stacktrace
mkdir -p $ROCKET_WORKSPACE/app/.build
code=$?
set -e
cp -r ${HOME}/.gradle $ROCKET_CACHE
# rsync -avz --verbose --exclude=tmp/ --exclude=intermediates/ --exclude='**/*.java' --exclude='**/*.class' ./app/build $ROCKET_ARTIFACTS
exit $code
