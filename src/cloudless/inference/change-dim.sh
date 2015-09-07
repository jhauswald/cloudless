#!/bin/sh
# love this fucking script <3
# NET = prototxt
# occurence of entry to change (if multiple input_dim for example)
# to value

NET=$1
OCC=$2
VAL=$3

tr "\n" "^" < $NET | sed "s/dim:\ [0-9]*/dim:\ ${VAL}/${OCC}" | tr '^' '\n' > temp.prototxt
mv temp.prototxt $NET
