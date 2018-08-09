#!/bin/bash

#script to build lineage os for P!m

cd ~
clear
while true
do
    echo "----------------"
    echo "| build script |"
    echo "----------------"
    echo
    echo "1. build full rom"
    echo "2. restart build"
    echo "3. Quit"
    echo
    read a
    if [ $a = 1 ]
    then
        clear
        echo "------------------"
        echo "| Full Rom Build |"
        echo "------------------"
        echo
        echo "making folders"
        mkdir los && cd los
        echo
        echo "done"
        echo 
        echo "syncing rom"
        echo
        echo "enter your github username"
        read uname
        echo "enter your github mail id"
        echo
        read umail
        git config --global user.name "uname"
        git config --global user.mail "umail"
        repo init -u git://github.com/LineageOS/android.git -b cm-14.1
        repo sync
        echo "done"
        echo
        echo "syncing device sources"
        echo
        git clone https://github.com/darklord4822/android_device_lenovo_P1m.git -b cm-14.1 device/lenovo/P1m
        git clone https://github.com/z3r0c00l-2k/android_vendor_lenovo_P1m.git -b n vendor/lenovo/P1m
        git clone https://github.com/darklord4822/android_kernel_lenovo_P1m.git -b master kernel/lenovo/P1m
        echo "done"
        echo 
        echo "applying patches"
        echo
        cd device/lenovo/P1m/patches
        bash apply-patches.sh
        cd ../../../../
        echo
        echo "done"
        echo
        echo "fix any erros which occured while patching"
        echo "else it will cause compiling errors and rom bugs"
        echo
        echo "setting some other things"
        export CCACHE_DIR=./.ccache
        ccache -C
        export USE_CCACHE=1
        export CCACHE_COMPRESS=1
        prebuilts/misc/linux-x86/ccache/ccache -M 50G
        export USE_NINJA=false
        echo
        echo "done"
        echo
        echo "starting compiling"
        echo
        source build/envsetup.sh
        lunch lineage_P1m-userdebug
        brunch lineage_P1m -j$(nproc --all)
        echo "done"
        echo
    elif [ $a = 2 ]
    then
        echo
        echo "------------------------"
        echo "| Restarting compiling |"
        echo "------------------------"
        echo
        source build/envsetup.sh
        lunch lineage_P1m-userdebug
        brunch lineage_P1m -j$(nproc --all)
        echo "done"
        echo
    elif [ $a = 3 ]
    then
        break
    else
        echo "choose an option"
    fi
done