#!/bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# != 2 ]; then
    echo "usage: $0 <build dir> <output dir>"
    exit 1
fi

IOS_FW_BUILD=$1
IOS_FW_ARTIFACTS=$2
IOS_FW_PROJECT_NAME=NabtoClient
IOS_FW_BUILD_ROOT=$DIR

function sdk {
    echo "================ iOS: Build SDK Framework Bundle ================"
    set -e
    
    rm -rf $IOS_FW_BUILD
    rm -rf $IOS_FW_ARTIFACTS
    mkdir -p $IOS_FW_BUILD
    mkdir -p $IOS_FW_ARTIFACTS

    # bitcode options from https://stackoverflow.com/questions/33106117/how-do-i-make-fat-framework-with-bitcode-option and https://medium.com/@heitorburger/static-libraries-frameworks-and-bitcode-6d8f784478a9

    xcodebuild -workspace NabtoClient.xcworkspace -UseModernBuildSystem=NO -scheme "${IOS_FW_PROJECT_NAME}" ONLY_ACTIVE_ARCH=NO -configuration Release -sdk iphoneos BUILD_DIR=${IOS_FW_BUILD} BUILD_ROOT="${IOS_FW_BUILD_ROOT}" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode clean build
    xcodebuild -workspace NabtoClient.xcworkspace -UseModernBuildSystem=NO -scheme "${IOS_FW_PROJECT_NAME}" ONLY_ACTIVE_ARCH=NO -configuration Release -sdk iphonesimulator BUILD_DIR=${IOS_FW_BUILD} BUILD_ROOT="${IOS_FW_BUILD_ROOT}" OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode clean build
    
    IOS_FW_DEVICE_DIR="${IOS_FW_BUILD}/Release-iphoneos/${IOS_FW_PROJECT_NAME}.framework"
    IOS_FW_SIM_DIR="${IOS_FW_BUILD}/Release-iphonesimulator/${IOS_FW_PROJECT_NAME}.framework"
    
    # pick one to use for base structure (everything interesting is identical)
    cp -R ${IOS_FW_DEVICE_DIR} ${IOS_FW_ARTIFACTS}

    # build universal binary
    lipo -create ${IOS_FW_DEVICE_DIR}/${IOS_FW_PROJECT_NAME} ${IOS_FW_SIM_DIR}/${IOS_FW_PROJECT_NAME} -output ${IOS_FW_ARTIFACTS}/${IOS_FW_PROJECT_NAME}.framework/${IOS_FW_PROJECT_NAME}
    
    cp LICENSE ${IOS_FW_ARTIFACTS}/${IOS_FW_PROJECT_NAME}.framework
    cp ${DIR}/NabtoClient/NabtoClient.h ${IOS_FW_ARTIFACTS}/${IOS_FW_PROJECT_NAME}.framework/Headers

    cd $IOS_FW_ARTIFACTS
    zip -r ${IOS_FW_PROJECT_NAME}.framework.zip ${IOS_FW_PROJECT_NAME}.framework    
}

sdk

