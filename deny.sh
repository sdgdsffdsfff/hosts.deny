#!/bin/bash

# @create: 2015.01.17
# @update: 2015.01.17
# @author: me@mrue.cn

PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH

TCP_DENY="/etc/hosts.deny"
WEB_DENY="/etc/nginx/vhosts/acces-deny.inc"

[ ! -f "./hosts.deny" ] && echo -e "\e[1;31mBlacklist file is not exists! \e[0m" && exit 1;
[ ! -f "$WEB_DENY" ] && echo -e "\e[1;31mWeb Server config file \"$WEB_DENY\" is not exists! \e[0m" && exit 1;

for ip in $(cat hosts.deny|awk '{print $1}')
do
    echo "ALL:$ip"   >> $TCP_DENY
    echo "deny $ip;" >> $WEB_DENY
done
