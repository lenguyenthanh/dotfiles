#!/bin/sh
set -euo pipefail
IFS=$'\n\t'

for i in $(fd -t f $1); do
    sed -i -e "s/$2/$3/g" $i
done
