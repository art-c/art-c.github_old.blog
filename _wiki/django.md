---
layout  : wiki
title   : django
summary : django
date    : 2020-01-20 12:19:11 +0900
updated : 2020-01-21 16:33:36 +0900
tag     : django
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# django

## 명령어
* super유저 생성 
	* `python3 manage.py createsuperuser` 
* query 할 때 유의할 점
	* modelName.objects.all() #아직 쿼리가 실행되지 않음
	* modelName.objects.all()[10:20] #slice 색인은 쿼리 색인됨
	* modelName.objects.get(id=5)[10:20] #slice 색인은 쿼리 색인됨

### settins.py
* postgresql 유닉스 도메인 소켓(Unix domain socket) 사용시 주의사항
- .s.PGSQL.5432는 빼고 소켓 디렉토리까지만 인자로 넘긴다. 
