#!/bin/bash

# Normalize linux config files. Remove empty lines and sort config entries by dictionary order.
# Usage: dev-sort-config.sh [config1] [config2] ... [configN]
#
# Or, without arguments...
# Usage: read config file from stdin. Sorted config will be printed to stdout.

# Note: Setting LANG=zh_CN.UTF-8 causes sort to ignore leading hashtags - do not remove.

if [ $# -eq 0 ]; then
	sed -E '/^(# )?CONFIG/!d' | LANG=zh_CN.UTF-8 sort
else
	for config in "$@"; do
		env LANG=zh_CN.UTF-8 sort -o "$config"{,}
		sed -E '/^(# )?CONFIG/!d' \
		    -i "$config"
	done
fi
