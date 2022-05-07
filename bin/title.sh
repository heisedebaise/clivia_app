#!/bin/bash

title='Clivia'

sed -i "s/window.CreateAndShow(L\".*\", origin, size)/window.CreateAndShow(L\"$title\", origin, size)/g" windows/runner/main.cpp

sed -i "s/gtk_header_bar_set_title(header_bar, \".*\");/gtk_header_bar_set_title(header_bar, \"$title\");/g" linux/my_application.cc
sed -i "s/gtk_window_set_title(window, \".*\");/gtk_window_set_title(window, \"$title\");/g" linux/my_application.cc

sed -i "s/<title>.*<\/title>/<title>$title<\/title>/g" web/index.html
