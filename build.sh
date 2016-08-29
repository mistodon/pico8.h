#!/usr/bin/env bash

outfile=${1:-"pico8.h"}

function append()
{
    cat $1 >> $outfile
    echo "" >> $outfile
    echo "" >> $outfile
}

rm -f $outfile
echo "-- pico8.h --" >> $outfile
append constants.lua
append vectors.lua
append render.lua
append aspects.lua
echo "-- end pico8.h --" >> $outfile