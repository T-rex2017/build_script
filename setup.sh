#!/usr/bin/env bash

export CCACHE_DIR=./.ccache

ccache -C

export USE_CCACHE=1

export CCACHE_COMPRESS=1

prebuilts/misc/linux-x86/ccache/ccache -M 50G

export USE_NINJA=false
