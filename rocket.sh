#!/usr/bin/env bash
mkdir -p "${HOME}/.gradle"
if [[ -d $ROCKET_CACHE/.gradle ]];then
    cp -r $ROCKET_CACHE/.gradle $HOME
fi    
./gradlew assemble test --stacktrace
mkdir -p $ROCKET_WORKSPACE/app/.build
code=$?
cp -r ${HOME}/.gradle $ROCKET_CACHE
exit $code
