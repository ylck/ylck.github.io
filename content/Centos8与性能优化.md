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

# 参考
[RHEL8 发行说明](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/considerations_in_adopting_rhel_8/index#performance-analysis-and-observability-tools_kernel)

[tuned](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/getting-started-with-tuned_monitoring-and-managing-system-status-and-performance#tuned-profiles_getting-started-with-tuned)

