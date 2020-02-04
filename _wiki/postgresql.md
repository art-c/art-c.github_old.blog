--
layout  : wiki
title   : postgresql
summary : postgresql
date    : 2020-01-19 20:41:57 +0900
updated : 2020-02-01 12:34:39 +0900
tag     : db, database
toc     : true
public  : true
parent  : database
latex   : false
---
* TOC
{:toc}

# postgresql

* 기본설치(centos7)
- `sudo yum  -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm`
- `sudo yum -y  install postgresql12-server postgresql12`
- `sudo /usr/pgsql-12/bin/postgresql-12-setup initdb`
- `sudo nvim /var/lib/pgsql/12/data/pg_hba.conf`
  `host    all             all             172.18.0.2/32            md5`
- 

## TIP
* **BACKUP(백업)** && restore(복원)
- [link](https://gist.github.com/juhyun210/b4a239c7399cd8f50198d227409df930)

* `pg_hba.conf`
- [설명](https://www.postgresdba.com/bbs/board.php?bo_table=B12&wr_id=36)

* 복원
```bash
#복원:
su postgres
gunzip -c fileName.gz | psql dbName

#주의할점:확장자가 zip등이면 gz으로 변경후 실행할 것!
```

* 유닉스 소켓 사용법
 - postgresql.conf에서 설정, var/run/postgresql, /tmp 디렉토리는 기본 디렉토리로 로컬에서 로그인 시 사용되는 유닉스 소켓임.그대로 둘것.
 ```unix_socket_directories = '/var/run/postgresql, /tmp, /your/other/path' # comma-separated list of directories```
 
* 서버 메모리 크기에 따른 설정값 조정
- https://m.blog.naver.com/ssik425/220112222231

## 명령어
* databse 소유자 변경 : `alter databse mydb owner to myname;`
* table 소유자 변경 : `alter table mytable tablename owner to yourname;`
* 소유자 한번에 변경 : `reassign owned by 현재소유자 to 새로운소유자;`
	- 모든 DB, TABLE에 적용되는 것 같음.
* 


## 에러

* `psql: error: could not connect to server: 치명적오류:  호스트 "[local]", 사용자 "postges", 데이터베이스 "postgres", SSL 중지 연결에 대한 설정이 pg_hba.conf 파일에 없습니다.`
- 해결 
`local  alll  all                 peer ` 을
`local  all   all                 peer `로 수정후 해결

### 구문오류
* - (dash)를 인식하지 못하는 에러
```sh
오류:  구문 오류, "-" 부근
줄 1: create database my-project;
```
- postgresql12로 업그레이드 하고 발생한 현상. 이전 버전에선 문제없었음.
- 해결방안:"my-project"와 같이 이중 따옴표로 해결
- 가능하면 - 를 사용하지 않도록 
- 

## JSONB query

## 일반 쿼리
### 쿼리 개수 제한(10개)
``` select * from tableName limit 10```
``` select * from tableName limit 10 offset 0``` 
- offset을 사용하여 쿼리 결과에서 범위를 설정하여 뽑아낼 수 있음.

### WHERE IN
* WHERE 컬럼이름 IN (조건1, 조건2, 조건3,...)
- 설명: 컬럼이름에 필드값과 IN 뒤 나열된 조건1, 조건2,... 등에 하나라도 일치하는 레코드를 가져오게 된다.
* WHERE 컬럼이름 NOT IN (조건1, 조건2, 조건3,...)
- 설명: 조건에 일치하지 않는 레코드를 가져온다.

### 배열다루기
- https://wwwi.tistory.com/350

### unnest(배열을 row로 분해)  사용(psycopg2)
```python
#psycopg2 사용예제

cur.execute("INSERT INTO mytable SELECT unnest(%s), unnest(%s::jsonb[])", (listtypeVar1, listtypeVar2 ) )
```
- ::type 은 타입캐스팅이다. %s::jsonb[] 은%s에 대응되는 데이터를 json를 담은 배열로 캐스팅(인식)시킨다. listtypevar2에 json타입이 들어있지만 명시적으로 캐스팅 하지 않으면 dict타입으로 인식되어 postgresql에 입력되지 않고 에러가 발생한다.
 
 
### WHERE 정규표현식

```sql
SELECT field1, field2 FROM mytable WHERE field1 ~ '^times';
field1      |   field2   
------------+----------
timestamp   |      8     
timestamptz |      8     
(2 rows)
```

### time관련

```
#현재 타임존
SHOW TIMEZONE;

       TimeZone
---------------------
America/Los_Angeles
(1 row)

#특정지역(현재시스템 타임존) 시간을 다른 지역 시간대로 맞게 보여주기(2020-01-01 00:00은 Los_Angeles 시간이다.)
SELECT timezone('America/New_York', '2020-01-01 00:00');
      timezone       
---------------------
 2019-12-31 10:00:00
(1 row)
```



