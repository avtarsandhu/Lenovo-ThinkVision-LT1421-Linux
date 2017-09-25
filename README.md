# Fanless computers are the future ....


There maybe some useful scripts here for people trying to
add a ThinkVision LT1421 USB monitor in Linux (ubuntu / mint)

I am  using the script (butchered) on
Linux Mint 18.2 Sonya /  lenovo Thinkpad e420s

Also I've got a script which trys to control the fan from spinning all day long


# Big shout out to the guys who gave me the code ..

* thecaffiend's repo [https://github.com/thecaffiend/tvlt1421_ubuntu]


# Usage

Make the *.bash scripts executable

$ chmod +x thinkvision-left-hdmi-right.bash thinkvision-set-left.bash thinkvision-set-right.bash


This sets the thinkvision right

    $ bash thinkvision-set-right.bash on

Off can be used with any of the bash scripts
ex:

    $ bash thinkvision-set-left.bash off

Best to create an alias for these so you can use them quickly git



Unless you are running an X1 carbon (original script) you might need to make this fit your needs

Run

    $ xrandr

After you do this, look for the name of your monitor, on the X1 was LVDS1,


Once you know this, you can change the code in these files change them.
Find where LVDS1 is referenced  change that to your monitor.
