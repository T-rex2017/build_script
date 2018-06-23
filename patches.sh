#!/usr/bin/env bash

#apply patches

cd device/lenovo/P1m/patches

bash apply-patches.sh

cd ../../../../

echo "fix any erros which occured while patching"
echo "else it will cause compiling errors and rom bugs"
