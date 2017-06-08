#!/bin/sh

SALTCONFIG="/usr/local/etc/salt/master"
cp ${SALTCONFIG}.sample "$SALTCONFIG"
sed -ie "s/#auto_accept: False/auto_accept: True/g" "$SALTCONFIG"
sysrc salt_master_enable="YES"
sysrc hostname="master"
service salt_master start
