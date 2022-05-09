#!/bin/bash

mkdir -p l10n

rm -rf l10n/base
cp -rf ../clivia_base/l10n l10n/base

rm -rf l10n/user
cp -rf ../clivia_user/l10n l10n/user