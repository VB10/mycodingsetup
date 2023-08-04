#!/bin/bash
if [ "$1" = "force" ]
then
    flutter clean
    flutter pub get
    cd ios || exit
    pod deintegrate
    pod install
    cd ..
else
    flutter clean
    flutter pub get
fi
