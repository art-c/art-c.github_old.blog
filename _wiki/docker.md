---
layout  : wiki
title   : 
summary : 
date    : 2020-02-15 01:16:18 +0900
updated : 2020-07-06 00:08:59 +0900
tag     : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# 
- https://sarc.io/index.php/cloud/1680-docker-13-docker-swarm

# 호스트와 Docker 컨테이너간 파일 복사 방법
```docker
$ docker cp container_name:/path/to/file ~/myhostfolder/
```

# 외부에서 DB 컨테이너 백업하기
```
docker exec -it db_container mysqldump -umyname -pmypaswd db_name > /path/host/folder/backup.sql
```
- 위 방법으로 외부에서 crontab을 사용하여 주기적인 백업도 가능
