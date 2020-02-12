---
layout  : wiki
title   : 
summary : 
date    : 2020-02-04 22:24:45 +0900
updated : 2020-02-07 12:48:18 +0900
tag     : rabbmitmq
toc     : true
public  : true
parent  : index
latex   : false
---
* TOC
{:toc}

# Rabbitmq


### docker로 설치

`docker pull rabbitmq`
`docker run -d --hostname my-rabbit --name rabbitMQ --network docker-network_name --ip 172.18.0.x -e RABBITMQ_DEFAULT_USER=myID -e RABBITMQ_DEFAULT_PASS=mypassworkd rabbitmq`

### 웹 모니터 http 접속

* 설정
```
docker exec -it rabbitMq /bin/bash
rabbitmq-plugins enable rabbitmq_management
```

* 접속
- `http://172.18.0.x:15672`, docker run 에서 생성한 ID, PSWD 입력


### 직접 설치 

* 설치
```
yum install -y epel-release 
yum install -y erlang 
yum install -y rabbitmq-server 
rabbitmq-plugins enable rabbitmq_management 
systemctl enable rabbitmq-server 
```

* 사용자 생성
```
rabbitmqctl add_user username password
rabbitmqctl set_user_tags username administrator
rabbitmqctl set_permissions -p / username ".*" ".*" ".*"
```
