#!/bin/bash
set -e -x
ARTIFACTS=$1

# deploy
wget -q https://github.com/probonopd/linuxdeployqt/releases/download/5/linuxdeployqt-5-x86_64.AppImage -O linuxdeployqt.AppImage
chmod a+x linuxdeployqt.AppImage 
cp -f distfiles/Orion.desktop Orion.desktop
cp -f distfiles/orion.svg orion.svg
./linuxdeployqt.AppImage distfiles/Orion.desktop -qmldir=./src/qml -qmake=$QTDIR/bin/qmake -appimage -bundle-non-qt-libs -verbose=1
mv *-x86_64.AppImage $ARTIFACTS/orion-$PLATFORM-$TRAVIS_TAG.AppImage