#!/bin/bash -x

# Source spec for $VER.
source ../../spec
PREFIX="$PWD"/chromium-loongarch64/chromium/chromium-$VER

# Clone patches
git clone https://github.com/AOSC-Dev/chromium-loongarch64

# Copy and rename patches.
cp $PREFIX.*.diff "$PWD"/
rename -v chromium-$VER. "" "$PWD"/*.diff
rename -v .diff .patch "$PWD"/*.diff

# Cleaning up (-f for when running as normal user).
rm -rf "$PWD"/chromium-loongarch64
