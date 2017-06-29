#!/bin/bash

E_NODEVICE=3

# only one parameter is expected. either "on" or "off" (no quotes on the 
# command line). "on" will attempt to turn on the displaylink device, "off" 
# will try to turn it off, anything else will print usage and quit.
if [ $# -lt 1 ]
then 
   echo "Usage: $0 [on/off]"
   exit
fi

case "$1" in 

# turn it on
on)
   echo "Attenpting to turn on the device!"
   ;;
# turn it off
off)
   echo "Attempting to turn off the device!"
   ;;
# otherwise
*)
   echo "Invalid option given. Expected only 'on' or 'off' (without quotes)"
   exit 1
   ;;
esac

# get the number associated with the usb monitor (the X in DVI-X from the 
# output of xrandr).
# TODO - this currently assumes only on DVI-X is found, this should be updated
#        to look for something "DisplayLink" specific in the output of xrandr 

#DVIN=`xrandr | grep DVI* | cut -f1 -d' ' | cut -f2 -d'-'`
DVIN=`xrandr | grep DVI* | cut -f1 -d' '`

#if [ -n "$DVIN" ]
   if [ "$DVIN" ]
then
   #echo "Device found at DVI-$DVIN"
   echo "Device found at $DVIN"
else
   echo "No appropriate device found!"
   exit $E_NODEVICE
fi

# now try to turn on or off
if [ "$1" == "on" ]
then
   xrandr --output $DVIN --off 
   xrandr --output HDMI1 --off

sleep 1

   xrandr --newmode "1368x768_59.90"  85.72  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
   xrandr --addmode $DVIN 1368x768_59.90

sleep 1

   xrandr --output HDMI1 --mode "1920x1080" --right-of LVDS1

sleep 1
   #xrandr --output $DVIN --off   
   # TODO - Makes the assumption the eDP1 is the primary montior. I do not know
   #        how often this holds true.  
   xrandr --output $DVIN --mode "1368x768_59.90" --left-of LVDS1 #Set for X1's default monitor 
else
   # shouldn't be able to get here unless "$1" is "off" 
   xrandr --output $DVIN --off
fi
