#!/bin/bash

# @create: 2015.01.17
# @update: 2015.01.17
# @author: me@mrue.cn

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH

TCP_DENY="/etc/hosts.deny"
WEB_DENY="/etc/nginx/vhosts/acces-deny.inc"

[ ! -f "./hosts.deny" ] && echo -e "" && exit;
for ip in $(cat hosts.deny|awk '{print $1}')
do
    echo "ALL:$ip"   >> $TCP_DENY
    echo "deny $ip;" >> $WEB_DENY
done
