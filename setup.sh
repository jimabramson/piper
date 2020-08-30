cp -R pi/. /home/pi/

# set up omxplayer
wget https://www.dropbox.com/s/4m38yj2ggosy13e/omxplayer-2018-06-27-raspbian-stretch-pib3%2B.tgz -P /tmp
sudo tar -C / -zxvf /tmp/omxplayer-2018-06-27-raspbian-stretch-pib3+.tgz

# set up ntp
sudo apt-get -y install ntp
sudo cp etc/ntp.conf /etc/ntp.conf
sudo chown -R ntp /var/log/ntpstats  # doesnt do the trick apparently

# these guys may or may not get in the way - disable them to avoid issues
sudo systemctl disable systemd-timesyncd
sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service

# bump gpu_mem, may or may not be doing anything useful
sudo cp boot/config.txt /boot/config.txt

# set up wifi client
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/

# set up the player to start automatically
sudo cp etc/systemd/system/syncplayer.service /etc/systemd/system/
sudo systemctl enable syncplayer.service

# install exfat support for usb drive
sudo apt-get install exfat-fuse
# configure fstab
sudo cp etc/fstab /etc/
