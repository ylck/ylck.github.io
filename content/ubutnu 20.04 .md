+++
title = "Ubuntu 20.04改变"
date =  2020-12-09

[taxonomies]
categories = ["linux"]
tags = ["ubuntu","linux"]
+++

> ### network manage

Old

```shell
 cat /etc/network/interfaces
# Generated by SolusVM

 auto lo
  iface lo inet loopback

 auto eth0
  iface eth0 inet static
   address 10.0.3.26
   gateway 10.0.3.1
   netmask 255.255.255.0
   dns-nameservers 1.1.1.1 1.0.0.1
```

new

```shell
cat /etc/netplan/00-install.yaml
network:
 version: 2
 renderer: networkd
 ethernets:
   eth0:
        addresses:
             - 10.0.3.26/24
        gateway4: 10.0.3.1
        nameservers:
                addresses:
                      - 1.1.1.1
                      - 8.8.8.8
```

> ### package manager

```
snap install docker
```

# 参考

[16 -- 20](https://askubuntu.com/questions/1263794/how-to-upgrade-from-ubuntu-16-04-lts-to-20-04-in-virtual-machine)

[20 network](https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-configure-networking-in-ubuntu-20-04-with-netplan/)