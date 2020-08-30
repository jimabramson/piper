SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $SCRIPT_DIR/setup-common.sh


### wifi AP
sudo apt-get -y install hostapd dnsmasq
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo cp etc/dhcpcd.conf /etc/
sudo cp etc/dnsmasq.conf /etc/
sudo cp etc/hostapd/hostapd.conf /etc/hostapd/
sudo cp etc/default/hostapd /etc/default/


### ntp follower
sudo apt-get -y install ntp
sudo cp etc/ntp.conf /etc/ntp-server.conf
sudo chown -R ntp /var/log/ntpstats  # TODO not working

