#!/bin/bash

name='Clivia'

sed -i "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$name\")/g" windows/CMakeLists.txt
sed -i "s/window.CreateAndShow(L\".*\", origin, size)/window.CreateAndShow(L\"$name\", origin, size)/g" windows/runner/main.cpp

sed -i "s/PRODUCT_NAME = .*/PRODUCT_NAME = $name/g" macos/Runner/Configs/AppInfo.xcconfig

sed -i "s/set(BINARY_NAME \".*\")/set(BINARY_NAME \"$name\")/g" linux/CMakeLists.txt
sed -i "s/gtk_header_bar_set_title(header_bar, \".*\");/gtk_header_bar_set_title(header_bar, \"$name\");/g" linux/my_application.cc
sed -i "s/gtk_window_set_title(window, \".*\");/gtk_window_set_title(window, \"$name\");/g" linux/my_application.cc

sed -i "s/<title>.*<\/title>/<title>$name<\/title>/g" web/index.html