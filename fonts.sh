#!/bin/sh
# Fancy fonts variables for shell
# Load with `source` or add before desired command.
# Copyright (c) 2019 Tuoran Zhang. http://tuoran.fam.cx/ mailto:tigerjieer@163.com
# Data from https://misc.flogisoft.com/bash/tip_colors_and_formatting

# Reset all
export FontClear=`printf '\e[0m'`

# Fonts
export FontBold=`printf '\e[1m'`
export FontDim=`printf '\e[2m'`
export FontInvert=`printf '\e[4m'`
export FontLine=`printf '\e[5m'`
export FontBlink=`printf '\e[7m'`
export FontHide=`printf '\e[8m'`

# Unset fonts
export FontUAll=`printf '\e[21m'`
export FontUBold=`printf '\e[22m'`
export FontUDim=`printf '\e[24m'`
export FontULine=`printf '\e[25m'`
export FontUBlink=`printf '\e[27m'`
export FontUHide=`printf '\e[28m'`

# Foregrond colors
export FontDefault=`printf '\e[39m'`
export FontBlack=`printf '\e[30m'`
export FontRed=`printf '\e[31m'`
export FontGreen=`printf '\e[32m'`
export FontYellow=`printf '\e[33m'`
export FontBlue=`printf '\e[34m'`
export FontMagenta=`printf '\e[35m'`
export FontCyan=`printf '\e[36m'`
export FontLightGray=`printf '\e[37m'`
export FontDGray=`printf '\e[90m'`	# D for dark
export FontLRed=`printf '\e[91m'`	# L for light
export FontLGreen=`printf '\e[92m'`
export FontLYellow=`printf '\e[93m'`
export FontLBlue=`printf '\e[94m'`
export FontLMagenta=`printf '\e[95m'`
export FontLCyan=`printf '\e[96m'`
export FontWhite=`printf '\e[97m'`

# Background colors
export FontBDefault=`printf '\e[49m'`
export FontBBlack=`printf '\e[40m'`
export FontBRed=`printf '\e[41m'`
export FontBGreen=`printf '\e[42m'`
export FontBYellow=`printf '\e[43m'`
export FontBBlue=`printf '\e[44m'`
export FontBMagenta=`printf '\e[45m'`
export FontBCyan=`printf '\e[46m'`
export FontBLGray=`printf '\e[47m'`
export FontBDGray=`printf '\e[100m'`
export FontBLRed=`printf '\e[101m'`
export FontBLGreen=`printf '\e[102m'`
export FontBLYellow=`printf '\e[103m'`
export FontBLBlue=`printf '\e[104m'`
export FontBLMagenta=`printf '\e[105m'`
export FontBLCyan=`printf '\e[106m'`
export FontBWhite=`printf '\e[107m'`

test "a$1" != 'a' &&
	$@


