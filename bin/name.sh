#!/bin/bash

package='org.lpw.clivia'
name='Clivia'

sed -i "s/android:label=\".*\"/android:label=\"$name\"/g" android/app/src/main/AndroidManifest.xml

sed -i "s/PRODUCT_BUNDLE_IDENTIFIER = .*;/PRODUCT_BUNDLE_IDENTIFIER = $package;/g" ios/Runner.xcodeproj/project.pbxproj
sed -i "/CFBundleDisplayName/{n;s/<string>.*<\/string>/<string>$name<\/string>/}" ios/Runner/Info.plist

sed -i "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$name\")/g" windows/CMakeLists.txt
sed -i "s/window.CreateAndShow(L\".*\", origin, size)/window.CreateAndShow(L\"$name\", origin, size)/g" windows/runner/main.cpp

sed -i "s/PRODUCT_BUNDLE_IDENTIFIER = .*;/PRODUCT_BUNDLE_IDENTIFIER = $package;/g" macos/Runner/Configs/AppInfo.xcconfig
sed -i "s/PRODUCT_NAME = .*/PRODUCT_NAME = $name/g" macos/Runner/Configs/AppInfo.xcconfig

sed -i "s/set(APPLICATION_ID \".*\")/set(APPLICATION_ID \"$package\")/g" linux/CMakeLists.txt
sed -i "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$name\")/g" linux/CMakeLists.txt
sed -i "s/gtk_header_bar_set_title(header_bar, \".*\");/gtk_header_bar_set_title(header_bar, \"$name\");/g" linux/my_application.cc
sed -i "s/gtk_window_set_title(window, \".*\");/gtk_window_set_title(window, \"$name\");/g" linux/my_application.cc

sed -i "s/<title>.*<\/title>/<title>$name<\/title>/g" web/index.html
