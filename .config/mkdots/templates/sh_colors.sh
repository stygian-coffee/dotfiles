#!/usr/bin/env bash

set -euo pipefail

foreground='{{foreground}}'
background='{{background}}'
cursorColor='{{cursorColor}}'
colors[0]='{{color0}}'
colors[1]='{{color1}}'
colors[2]='{{color2}}'
colors[3]='{{color3}}'
colors[4]='{{color4}}'
colors[5]='{{color5}}'
colors[6]='{{color6}}'
colors[7]='{{color7}}'
colors[8]='{{color8}}'
colors[9]='{{color9}}'
colors[10]='{{color10}}'
colors[11]='{{color11}}'
colors[12]='{{color12}}'
colors[13]='{{color13}}'
colors[14]='{{color14}}'
colors[15]='{{color15}}'
colors[16]='{{color16}}'
colors[17]='{{color17}}'
colors[18]='{{color18}}'
colors[19]='{{color19}}'
colors[20]='{{color20}}'
colors[21]='{{color21}}'

if [ "${TERM}" = "linux" ]; then
    # If we're in a TTY
    for i in {0..9} {A..F}; do
        echo -en '\e]P'"${i}$(echo "${colors[$i]}" | sed 's/^#//')"'\ec'
    done
else
    # Else we're (probably) in an xterm-compatible terminal
    echo -en '\e]10;'"${foreground}"'\e\'
    echo -en '\e]11;'"${background}"'\e\'
    for i in {0..21}; do
        echo -en '\e]'"4;${i};${colors[$i]}"'\e\'
    done
fi
