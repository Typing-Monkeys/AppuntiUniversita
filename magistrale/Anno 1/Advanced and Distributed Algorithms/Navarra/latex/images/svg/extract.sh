#!/bin/bash

CMD=$1
SVGS=$(ls *.svg*)

for SVG in $SVGS; do
    NAME=$(echo "$SVG" | cut -d'.' -f1)
    $CMD -f $SVG -A ../$NAME.pdf 2> /dev/null
    echo "Conversione file: " $SVG
done

