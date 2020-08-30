### system baseline
sudo systemctl disable systemd-timesyncd
sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service

sudo cp boot/config.txt /boot/config.txt


### usb drive
sudo apt-get install exfat-fuse
sudo cp etc/fstab /etc/


### video player

# scripts
cp -R pi/. /home/pi/

# omxplayer
wget https://www.dropbox.com/s/4m38yj2ggosy13e/omxplayer-2018-06-27-raspbian-stretch-pib3%2B.tgz -P /tmp
sudo tar -C / -zxvf /tmp/omxplayer-2018-06-27-raspbian-stretch-pib3+.tgz

# system service
sudo cp etc/systemd/system/syncplayer.service /etc/systemd/system/
sudo systemctl enable syncplayer.service


### wifi client
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/


### ntp follower
sudo apt-get -y install ntp
sudo cp etc/ntp.conf /etc/ntp.conf
sudo chown -R ntp /var/log/ntpstats  # TODO not working

