---
layout  : wiki
title   : ping막기
summary : ping막기
date    : 2020-02-02 09:44:35 +0900
updated : 2020-02-02 09:47:38 +0900
tag     : ping막기
toc     : true
public  : true
parent  : centos7
latex   : false
---
* TOC
{:toc}

# centos7d에서 ping 막기
* root 권한필요, 다음 명령으로 해결
 
```bash
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
```

# ping 다시 허용하기
 
```bash
echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
```

