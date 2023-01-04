#!/bin/bash

# Normalize linux config files. Remove empty lines and sort config entries by dictionary order.
# Usage: read config file from stdin
# Sorted config will be printed to stdout.

# Note: Setting LANG=zh_CN.UTF-8 causes sort to ignore leading hashtags - do not remove.

sed -E '/^(# )?CONFIG/!d' | LANG=zh_CN.UTF-8 sort
