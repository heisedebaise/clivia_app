#!/bin/bash

label=1.0.2
number=3

sed -i "s/^version: [0-9.+]*$/version: $label+$number/g" pubspec.yaml