#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No target specified"
    exit 1
fi

target="$1"
echo building target: $target...
export PATH=$PATH:/Users/pengyundai/GSWave/depot_tools/

ninja -C out_ios/Debug-iphoneos $target
ninja -C out_ios/Release-iphoneos $target
ninja -C out_ios64/Debug-iphoneos $target
ninja -C out_ios64/Release-iphoneos $target

echo copying target:lib$target.a...
echo to Debug/ios_arm
cp out_ios/Debug-iphoneos/lib$target.a ../../softphone/libraries/gsmedia/externals/build/webrtc/ios/Debug/ios_arm/
echo to Release/ios_arm
cp out_ios/Release-iphoneos/lib$target.a ../../softphone/libraries/gsmedia/externals/build/webrtc/ios/Release/ios_arm/
echo to Debug/ios_64
cp out_ios64/Debug-iphoneos/lib$target.a ../../softphone/libraries/gsmedia/externals/build/webrtc/ios/Debug/ios_64/
echo to Release/ios_64
cp out_ios64/Release-iphoneos/lib$target.a ../../softphone/libraries/gsmedia/externals/build/webrtc/ios/Release/ios_64/
echo done.
