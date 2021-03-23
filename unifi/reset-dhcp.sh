#!/bin/vbash
run=/opt/vyatta/bin/vyatta-op-cmd-wrapper
IP=$(/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')
NETWORK=${IP%%.*}

if [ $NETWORK = 192 ]
then
  echo resetting DHCP
  $run renew dhcp interface eth0
fi

