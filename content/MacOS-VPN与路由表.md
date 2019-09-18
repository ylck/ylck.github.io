+++
title = "MacOS-VPN与路由表"
date =  2019-09-18+00:00

[taxonomies]
categories = ["MacOS"，"router"]
tags = ["MacOS"，"router"]
+++

> `brew install iproute2mac`
```bash
    #! /bin/sh
set -x
#GATEWAY_IP=$(ip route show default | awk '{ print $3}')
#GATEWAY_IP=192.168.1.1
read -p "Input passwd: "  GATEWAY_IP && echo $GATEWAY_IP
ip route del default
ip route add default via GATEWAY_IP
#rm -f china_ip_list.txt
wget -c https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt
for i in $(cat ./china_ip_list.txt)
do
    ip route add "$i" via "$GATEWAY_IP"  dev en0
done
```

> 重置
> sudo route -n flush; sudo route -n flush; sudo route -n flush;
> ifconfig en0 down&&ifconfig en0 up


# 参考
[china_ip_list](https://github.com/17mon/china_ip_list)
[flush-routing-table](http://webdeveloper.gdemolished.com/how-to-flush-routing-table-on-a-mac/)

