+++
title = "V2ray Haproxy"
date =  2019-09-15T11:28:59+08:00

[taxonomies]
categories = ["v2ray","Haproxy"]
tags = ["v2ray","Haproxy","Tools"]
+++


> V2ray installe
> <https://github.com/233boy/v2ray/wiki/V2Ray%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC>
```bash
bash <(curl -s -L https://git.io/v2ray.sh)
```


> Haproxy config
```config
global
    log 127.0.0.1 local0 notice
    daemon
    nbproc 8

defaults
    log global
    mode tcp
    balance source

    option redispatch      #当serverId对应的服务器挂掉后，强制定向到其他健康的服务器
    option abortonclose
    timeout connect 3s
    timeout client 1m
    timeout server 1m

frontend main
    bind *:15555
    default_backend ss-server

backend ss-server
    server hk xxx.xxx.xxx.xxx:15555 check inter 1000 rise 3 fall 2 weight 254

    server tokyo xxx.xxx.xxx.xxx:15555 check inter 1000 rise 3 fall 2 weight 252

    server chk xxx.xxx.xxx.xxx:15555 check inter 1000 rise 3 fall 2  weight 256
    server hs-hk xxx.xxx.xxx.xxx:15555 check inter 1000 rise 3 fall 2 weight 256
listen stats # Define a listen section called "stats"
  bind localhost:9000 # Listen on localhost:9000
  mode http
  stats refresh 30s
  stats enable  # Enable stats page
  stats hide-version  # Hide HAProxy version
  stats realm Haproxy\ Statistics  # Title text for popup window
  stats uri /haproxy_stats  # Stats URI
```



