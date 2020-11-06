#!/bin/bash                                                                                                                                                                                                                                                    
                                                                                                                                                                                 
# From https://gist.github.com/amanusk/6b79d407945ca79caa945ce2658fd987
# (with some mods)                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                               
# This is your default laptop screen, detect by running `xrandr`                                                                                                                                                                                               
INTERNAL_OUTPUT="eDP1"                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                               
# choices will be displayed in dmenu                                                                                                                                                                                                                           
choices="laptop\ndual\nexternal\nclone"                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                               
# Your choice in dmenu will determine what xrandr command to run                                                                                                                                                                                               
chosen=$(echo -e $choices | dmenu -i)                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                               
if [ `xrandr | grep HDMI-1 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="HDMI-1"
fi
if [ `xrandr | grep HDMI-2 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="HDMI-2"
fi
if [ `xrandr | grep HDMI-3 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="HDMI-3"
fi
if [ `xrandr | grep DP1 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="DP-1"
fi
if [ `xrandr | grep DP-2 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="DP-2"
fi
if [ `xrandr | grep DP-3 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="DP-3"
fi
if [ `xrandr | grep DP2-1 | grep -c ' connected '` -eq 1 ]; then
        EXTERNAL_OUTPUT="DP2-1"
fi

# xrander will run and turn on the display you want, if you have an option for 3 displays, this will need some modifications
case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off ;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT ;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary ;;

esac
