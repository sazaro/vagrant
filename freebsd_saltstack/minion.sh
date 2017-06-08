#!/bin/sh

# Author: Sean Smith
# Date: 3/22/2017
# A simple script to bootstrap the vagrant host as a salt minion

SALTCONFIG="/usr/local/etc/salt/minion"
SALTMASTER="10.100.40.20"
SALTHOSTNAME="minion$1"

sysrc salt_minion_enable="YES"
sysrc hostname="minion$1"

cp ${SALTCONFIG}.sample "$SALTCONFIG"

sed -ie "s/#id:/id: "$SALTHOSTNAME"/g" "$SALTCONFIG"
sed -ie "s/#master: salt/master: $SALTMASTER/g" "$SALTCONFIG"
service salt_minion start

