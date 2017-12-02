# ThinkVision LT1421 USB monitor


There maybe some useful scripts here for people trying to
add a ThinkVision LT1421 USB monitor in Linux (ubuntu / mint)
I tried and failed to make  Displaylink drivers  work automatically
I failed but I'm not the only one  

I am  using the script (butchered) on
Linux Mint 18.2 Sonya /  

    lenovo Thinkpad e420s
    dell latitude e6220   


# Big shout out to the guys who gave me the code ..

* thecaffiend's repo [https://github.com/thecaffiend/tvlt1421_ubuntu]


# Usage

Make the *script executable

$ chmod +x usbmonitor


This sets the thinkvision right

    $ ./usbmonitor on

Off  $ ./usbmonitor off



Unless you are running an X1 carbon (original script) you might need to make this fit your needs

Run

    $ xrandr

After you do this, look for the name of your monitor, on the X1 was LVDS1,
Once you know this, you can change the code in these files change them.
Find where LVDS1 is referenced  change that to your monitor.
