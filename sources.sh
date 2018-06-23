#!/usr/bin/env bash

#sync sources

#device tree
git clone https://github.com/darklord4822/android_device_lenovo_P1m.git -b cm-14.1 device/lenovo/P1m

#vendor tree
git clone https://github.com/z3r0c00l-2k/android_vendor_lenovo_P1m.git -b n vendor/lenovo/P1m

#kernel tree
git clone https://github.com/darklord4822/android_kernel_lenovo_P1m.git -b master kernel/lenovo/P1m
