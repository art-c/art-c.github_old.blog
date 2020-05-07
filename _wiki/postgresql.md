---
layout  : wiki
title   : postgresql
summary : postgresql
date    : 2020-01-19 21:15:59 +0900
updated : 2020-05-07 17:56:55 +0900
tag     : postgresql
toc     : true
public  : true
parent  : database
latex   : false
---
* TOC
{:toc}

# postgresql

-   참고 사이트들

*   튜토리얼 : https://www.postgresqltutorial.com/
*   https://m.blog.naver.com/geartec82
*   튜닝값 생성 사이트:https://pgtune.leopard.in.ua/
*   ALTERSYSTEM : https://corekms.tistory.com/entry/94-betaALTER-SYSTEM-%EA%B5%AC%EB%AC%B8%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-%ED%8C%8C%EB%9D%BC%EB%A9%94%ED%84%B0-%EB%B3%80%EA%B2%BD
*   실수로 커밋:https://www.ilifo.co.kr/boards/article/59
*   다양한 명령어 : https://semode.tistory.com/6
*   10가지 모니터링 도구 : https://www.comparitech.com/net-admin/best-postgresql-monitoring-tools/
*   모니터링 시스템 구축:https://miiingo.tistory.com/93

-   기본설치(centos7)

*   `sudo yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm`
*   `sudo yum -y install postgresql12-server postgresql12`
*   `sudo /usr/pgsql-12/bin/postgresql-12-setup initdb`
*   `sudo nvim /var/lib/pgsql/12/data/pg_hba.conf`
    `host all all 172.18.0.2/32 md5`
*

## TIP

-   **BACKUP(백업)** && restore(복원)

*   [link](https://gist.github.com/juhyun210/b4a239c7399cd8f50198d227409df930)

-   `pg_hba.conf`

*   [설명](https://www.postgresdba.com/bbs/board.php?bo_table=B12&wr_id=36)

-   복원

```bash
#복원:
su postgres
gunzip -c fileName.gz | psql dbName

#주의할점:확장자가 zip등이면 gz으로 변경후 실행할 것!
```

-   불확실:쿼리 내에서 '내용' 대신 `$$내용$$`를 사용할 수 있는 것 같음

*   `$$[1,2,3]$$`

### 유닉스 소켓 사용법

-   postgresql.conf에서 설정, var/run/postgresql, /tmp 디렉토리는 기본 디렉토리로 로컬에서 로그인 시 사용되는 유닉스 소켓임.그대로 둘것.
    `unix_socket_directories = '/var/run/postgresql, /tmp, /your/other/path' # comma-separated list of directories`

-   서버 메모리 크기에 따른 설정값 조정

*   https://m.blog.naver.com/ssik425/220112222231

## 명령어

-   databse 소유자 변경 : `alter databse mydb owner to myname;`
-   table 소유자 변경 : `alter table mytable tablename owner to yourname;`
-   소유자 한번에 변경 : `reassign owned by 현재소유자 to 새로운소유자;` - 모든 DB, TABLE에 적용되는 것 같음.
-

## 에러

-   `psql: error: could not connect to server: 치명적오류: 호스트 "[local]", 사용자 "postges", 데이터베이스 "postgres", SSL 중지 연결에 대한 설정이 pg_hba.conf 파일에 없습니다.`

*   해결
    `local alll all peer` 을
    `local all all peer`로 수정후 해결

### 구문오류

-   -   (dash)를 인식하지 못하는 에러

```sh
오류:  구문 오류, "-" 부근
줄 1: create database my-project;
```

-   postgresql12로 업그레이드 하고 발생한 현상. 이전 버전에선 문제없었음.
-   해결방안:"my-project"와 같이 이중 따옴표로 해결
-   가능하면 - 를 사용하지 않도록
-

# 부분인덱스??

## JSONB query

### jsonb 함수

-   튜토리얼:https://www.postgresql.org/docs/9.6/functions-json.html
-   jsonb_set 참고 : http://blog.naver.com/PostView.nhn?blogId=anytimedebug&logNo=221327126224&parentCategoryNo=&categoryNo=28&viewDate=&isShowPopularPosts=true&from=search

### 인덱스 만들기

-   https://itholic.github.io/database-index/

### json, jsonb 기본 연산

-   _-> int_

*   JSON 배열에서 해당 요소를 JSON 형으로 뽑기(첫번째는 0)
*   '[{"a":"foo"},{"b":"bar"},{"c":"baz"}]'::json->2
*   {"c":"baz"}

-   _-> text_

*   해당 key에 대한 value를 JSON 형으로 뽑기
*   '{"a": {"b":"foo"}}'::json->'a'
*   {"b":"foo"}

-   _->> int_

*   -> 연산자와 같으나 리턴값이 text 형
*   '[1,2,3]'::json->>2
*   3

-   _->> text_

*   해당 key에 대한 value를 text 형으로 뽑기
*   '{"a":1,"b":2}'::json->>'b'
*   2

-   _#> text[]_

*   패스로 value를 JSON 형으로 뽑기
*   '{"a": {"b":{"c": "foo"}}}'::json#>'{a,b}'
*   {"c": "foo"}

-   _#>> text[]_

*   패스로 value를 text 형으로 뽑기
*   '{"a":[1,2,3],"b":[4,5,6]}'::json#>>'{a,2}'
*   3

### jsonb 전용 연산

-   _@> jsonb_

*   오른쪽 jsonb 값이 있는지?
*   '{"a":1, "b":2}'::jsonb @> '{"b":2}'::jsonb

-   _<@ jsonb_

*   왼쪽 jsonb 값이 있는지?
*   '{"b":2}'::jsonb <@ '{"a":1, "b":2}'::jsonb

-   _? text_

*   오른쪽 text 값이 jsonb 가운데 key로 있는지?
*   '{"a":1, "b":2}'::jsonb ? 'b'

-   _?| text[]_

*   오른쪽 집합의 요소가운데 하나라도 jsonb의 key로 있는지?
*   '{"a":1, "b":2, "c":3}'::jsonb ?| array['b', 'c']

-   _?& text[]_

*   jsonb의 key집합이 오른쪽 집합의 부분집합인지?
*   '["a", "b"]'::jsonb ?& array['a', 'b']

### ->, ->> 차이

-   -> jsonb로 반환, ->> 텍스트로 반환

### 특정 key가 있는 레코드 검색 ->

```
select  * from mytable where field1 ? 'key1';
select  * from mytable where field1->somthing ? 'key1';

```

### 특정 구조를 가진 레코드 검색 @> (있으면 true, 없으면 false)

### jsonb_array_elements

-   `[ {'a':1}, {'b':2} ]` 와 같은 형태에서 배열의 요소를 펼친다.(이 경우 2개의 행으로 만듦)

*   jsonb_build_object, jsonb 데이터를 만든다.

-   jsonb_build_object('member', null)
-   jsonb_build_object('member', 'babo')
-   주의 jsonb의 null과 postgesql의 null은 형식이 다르므로 주의(https://stackoverflow.com/questions/38777535/what-is-the-difference-between-and-in-postgres-sql)

*   json 배열에서 특정 값의 인덱스 알아내는법

## 일반 쿼리(query)

### 쿼리 개수 제한(10개)

`select * from tableName limit 10`
`select * from tableName limit 10 offset 0`

-   offset을 사용하여 쿼리 결과에서 범위를 설정하여 뽑아낼 수 있음.

### update select

-   https://devjjo.tistory.com/44

### WHERE IN

-   WHERE 컬럼이름 IN (조건1, 조건2, 조건3,...)

*   설명: 컬럼이름에 필드값과 IN 뒤 나열된 조건1, 조건2,... 등에 하나라도 일치하는 레코드를 가져오게 된다.

-   WHERE 컬럼이름 NOT IN (조건1, 조건2, 조건3,...)

*   설명: 조건에 일치하지 않는 레코드를 가져온다.

## 배열다루기

-   https://wwwi.tistory.com/350
-   https://stackoverflow.com/questions/46797328/how-to-get-index-of-an-array-value-in-postgresql/56775692
-   http://postgresql.kr/docs/9.6/arrays.html

### array_position (postgresql >= 9.5)

-   배열에서 특정 값의 인덱스를 알아내는 함수

### unnest(배열을 row로 분해) 사용(psycopg2)

```python
#psycopg2 사용예제
cur.execute("INSERT INTO mytable SELECT unnest(%s), unnest(%s::jsonb[])", (listtypeVar1, listtypeVar2 ) )
```

-   ::type 은 타입캐스팅이다. %s::jsonb[] 은%s에 대응되는 데이터를 json를 담은 배열로 캐스팅(인식)시킨다. listtypevar2에 json타입이 들어있지만 명시적으로 캐스팅 하지 않으면 dict타입으로 인식되어 postgresql에 입력되지 않고 에러가 발생한다.

### WHERE 정규표현식

-   주의 field1이 숫자와 같은 타입일 경우 정규표현식이 동작안할 수 있음 그럴 땐 `field1::char`와 같이 casting을 해주면 된다.

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

### 기타 함수들

-   타입 알아내기 : pg_typeof(x)
-

### 기타

-   제약조건 추가

```
ALTER TABLE cities ADD CONSTRAINT name PRIMARY KEY(name);
ALTER TABLE weather ADD CONSTRAINT city FOREIGN KEY(city) REFERENCES cities(name);
```

-   제약조건 삭제

```
ALTER TABLE weather DROP CONSTRAINT city;
ALTER TABLE cities DROP CONSTRAINT name;
```
