#!/usr/bin/env bash

echo "what is the romname?"
read romname

source build/envsetup.sh

lunch $romname_P1m-userdebug

brunch $romname_P1m-userdebug
