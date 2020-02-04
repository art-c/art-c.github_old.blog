---
layout  : wiki
title   : 
summary : 
date    : 2020-02-04 22:24:45 +0900
updated : 2020-02-04 22:26:26 +0900
tag     : 
toc     : true
public  : true
parent  : index
latex   : false
---
* TOC
{:toc}

# Rabbitmq

### 사용자 만들기

```
rabbitmqctl add_user username password
rabbitmqctl set_user_tags username administrator
rabbitmqctl set_permissions -p / username ".*" ".*" ".*"
```
