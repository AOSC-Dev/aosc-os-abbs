#!/bin/bash -e
# inst.sh <dir> <objs...>
dir="$1"; shift 1
mkdir -p "$dir"
if [ "$*" = "*" ]; then exit; fi

for f in "$@"; do
  if [ -f "$f" ]; then cp "$f" "$dir"; continue; fi
  if [ -d "$f" ]; then ( cd $f; $inst_sh "$dir/$f" * )
  else echo "*** Error - inst.sh $f in $dir failed." 1>&2;
	  echo "PWD = $(pwd)" 1>&2; exit 1; fi
done

