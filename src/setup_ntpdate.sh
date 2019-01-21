#!/bin/bash

# https://www.xn--tckk6a9dufrb.com/raspberry-piraspbian%E3%81%AEntp%E3%82%B5%E3%83%BC%E3%83%90%E8%A8%AD%E5%AE%9A/

timesyncd_conf='/etc/systemd/timesyncd.conf'
cp -a ${timesyncd_conf}{,.`date '+%Y%m%d'`}

sed -i 's/#NTP=.*/NTP=ntp.jst.mfeed.ad.jp/g' ${timesyncd_conf}
sed -i 's/#FallbackNTP.*/FallbackNTP=ntp.nict.jp time.google.com/g' ${timesyncd_conf}
systemctl restart systemd-timesyncd
