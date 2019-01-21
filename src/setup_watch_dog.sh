#!/bin/bash

watchdog_conf='/etc/watchdog.conf'
watchdog_service='/lib/systemd/system/watchdog.service'
cp -a ${watchdog_conf}{,.`date '+%Y%m%d'`}
cp -a ${watchdog_service}{,.`date '+%Y%m%d'`}

# watch dog enable
apt-get install watchdog
update-rc.d watchdog enable
modprobe bcm2835_wdt

# watch dog config edit
sed -i -e 's/#max-load-1\t/max-load-1\t/g' ${watchdog_conf}
sed -i -e 's/#watchdog-device\t/watchdog-device\t/g' ${watchdog_conf}
grep -e 'watchdog-timeout' ${watchdog_conf}
if $? -eq 1 ; then
  sed -i '$a watchdog-timeout = 10' ${watchdog_conf}
fi

# watchdog service edit
sed -i -e "s/WantedBy=.*/WantedBy=multi-user.target/g" ${watchdog_service}

# watchdog service enable
systemctl enable watchdog.service
