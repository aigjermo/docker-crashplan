#!/bin/bash
## Crashplan startup script. Alters the serviceHost value in my.service.xml to the current Docker IP Address
CMD=/opt/crashplan/bin/CrashPlanEngine

# copy default conf
[ -f /opt/crashplan/conf/default.service.xml ] || cp -r /opt/crashplan/conf.install/* /opt/crashplan/conf/

$CMD start
sleep 10

# update listen addr
ADDR=$(ip -f inet -o addr show eth0 | cut -d\  -f 7 | cut -d/ -f 1)
sed -i "s/<serviceHost>.*<\/serviceHost>/<serviceHost>$ADDR<\/serviceHost>/" /opt/crashplan/conf/my.service.xml
$CMD restart 

# attach to logs (stops container from stopping)
tail -f /opt/crashplan/log/engine_error.log
