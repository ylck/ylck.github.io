+++
title = "Centos8与性能优化"
date =  2019-10-18T17:28:59+08:00

[taxonomies]
categories = ["Centos8","bcc/BPF","tuned"]
tags = ["Centos8","bcc/BPF","tuned"]
+++

> ### tuned

```shell
    set

    tuned-adm profile network-latency   throughput-performance powersave

    get

    tuned-adm active
```

> ### bcc-tools

```
    cd /usr/share/bcc/tools/
    ./tcplif
```

> ### firewall-cmd

```
    firewall-cmd --list-ports
    firewall-cmd --add-port=8080/tcp  --permanent
    firewall-cmd --remove-forward-port=port=8080:proto=tcp:toport=80:toaddr=
    firewall-cmd --reload
    firewall-cmd --permanent --add-service=samba
```

旧版本 `iptables`

```
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf

sysctl -p
iptables -t nat -A PREROUTING -p udp -i eth0 --dport 51820 -j DNAT --to-destination 34.84.6.100:51820
iptables -A FORWARD -p udp -d 34.84.6.100 --dport 51820 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT∏
```

> ### nice&&renice

> 对于 CPU 密集型的程序 -20 fast 19 low

```bash
renice -20 -g `pgrep v2ray`
1637 (process group ID) old priority -20, new priority -20
```

# 参考

[RHEL8 发行说明](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/considerations_in_adopting_rhel_8/index#performance-analysis-and-observability-tools_kernel)

[tuned](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/getting-started-with-tuned_monitoring-and-managing-system-status-and-performance#tuned-profiles_getting-started-with-tuned)

[renice](https://linux.cn/article-4742-1.html)
