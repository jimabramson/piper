#!/bin/sh

if ! systemctl status hostapd; then
    # unless we are the leader (hosting the wifi ap), force an ntp sync
    /bin/systemctl stop ntp
    /usr/sbin/ntpd -gq
    /bin/systemctl start ntp
else
    echo "skipping ntp sync"
fi

