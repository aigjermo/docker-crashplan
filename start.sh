#!/bin/bash
## Crashplan startup script. Alters the serviceHost value in my.service.xml to the current Docker IP Address
interface=eth0
cmd=/opt/crashplan/bin/CrashPlanEngine

# copy default conf
[ -f /opt/crashplan/conf/default.service.xml ] || cp -r /opt/crashplan/conf.install/* /opt/crashplan/conf/

$cmd start
sleep 10
addr=$(ip -f inet -o addr show $interface|cut -d\  -f 7 | cut -d/ -f 1)
sed -i "s/<serviceHost>.*<\/serviceHost>/<serviceHost>$addr<\/serviceHost>/" /opt/crashplan/conf/my.service.xml
$cmd restart

tail -f /opt/crashplan/log/engine_error.log
