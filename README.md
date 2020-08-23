## Setup

1. burn sd card with stretch
   http://downloads.raspberrypi.org/raspbian/images/raspbian-2018-06-29/2018-06-27-raspbian-stretch.zip
2. touch 'ssh' to enable ssh (e.g. on mac os, re-mount the sd and do `touch /Volumes/boot/ssh`)
3. remove sd card and attach to pi device, connect ethernet & power (it will take a minute or two to boot)
4. figure out the IP address of the pi on the network.  (sorry you're on your own here, depending on how your network works)
5. ssh pi@<address>
6. enter the following commands: ```
sudo apt-get update && sudo apt-get install git
git clone https://github.com/jimabramson/piper.git
cd piper
chmod a+x setup.sh
./setup.sh
sudo systemctl reboot
```
7. connect HDMI.  when the pi reboots the player should sync up to the leader automatically (may take up to a few minutes).  In case of problems, ssh back into the pi and do `sudo systemctl status syncplayer` to see what the service is up to, or `journalctl -u syncplayer` to view its logs.

