#!/bin/bash

set -e

pod install

CONFIG=Release
PROJECT_NAME=NabtoClient
BUILD_ROOT=`pwd`
BUILD=$BUILD_ROOT/build-$CONFIG
ARTIFACTS=$BUILD_ROOT/dist
PRODUCT_PATH=Products/Library/Frameworks/${PROJECT_NAME}.framework
WORKSPACE=${PROJECT_NAME}.xcworkspace

rm -rf $ARTIFACTS
mkdir -p $BUILD
mkdir -p $ARTIFACTS

# iOS
xcodebuild clean archive \
    -workspace $WORKSPACE \
    -scheme "${PROJECT_NAME}" \
    -archivePath $BUILD/ios.xcarchive \
    -configuration $CONFIG \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# iOS sim
xcodebuild clean archive \
    -workspace $WORKSPACE \
    -scheme "${PROJECT_NAME}" \
    -archivePath $BUILD/ios-sim.xcarchive \
    -configuration $CONFIG \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
           -framework "$BUILD/ios.xcarchive/$PRODUCT_PATH" \
           -framework "$BUILD/ios-sim.xcarchive/$PRODUCT_PATH" \
           -output "$ARTIFACTS/$PROJECT_NAME.xcframework"

cd $ARTIFACTS
cp ../LICENSE ../README.md ${PROJECT_NAME}.xcframework

zip -r ${PROJECT_NAME}.xcframework.zip ${PROJECT_NAME}.xcframework
