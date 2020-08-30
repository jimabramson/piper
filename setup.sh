SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $SCRIPT_DIR/setup-common.sh


### wifi client
sudo cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/


### ntp follower
sudo apt-get -y install ntp
sudo cp etc/ntp.conf /etc/ntp.conf
sudo chown -R ntp /var/log/ntpstats  # TODO not working

