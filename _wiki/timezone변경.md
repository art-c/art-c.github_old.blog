---
layout  : wiki
title   : timezone변경
summary : timezone변경
date    : 2020-02-03 16:40:48 +0900
updated : 2020-02-03 16:46:04 +0900
tag     : timezone
toc     : true
public  : true
parent  : centos7
latex   : false
---
* TOC
{:toc}

# timezone변경 
 
`date` 명령으로 현재시간 및 timezone 확인

`timedatectl set-timezone Asia/Seoul`

# timezone 목록 확인
`timedatectl list-timezones`

# 수동으로 타임존 변경
1. /etc/locltime 삭제
2. `ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime`
