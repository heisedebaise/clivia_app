#!/bin/bash

label=1.0.2
number=3

sed -i "s/^version: [0-9.+]*$/version: $label+$number/g" pubspec.yaml

sed -i "s/flutterVersionCode = '[0-9]*'/flutterVersionCode = '$number'/g" android/app/build.gradle
sed -i "s/flutterVersionName = '[0-9.]*'/flutterVersionName = '$label'/g" android/app/build.gradle