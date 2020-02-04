---
layout  : wiki
title   : django
summary : django
date    : 2020-01-20 12:19:11 +0900
updated : 2020-02-04 15:09:07 +0900
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

## models.py


### postgresql JSONB 지원 자료형
```
from django.contrib.postgresql.fields import JSONField
#사용예제
class MyModel( models.Model):
    fieldName = JSONField(blank=True, null=True)
```

### Error 해결
* ?: (translation.E004) You have provided a value for the LANGUAGE_CODE setting that is not in the LANGUAGES setting.
- settings.py에 다음 코드 추가
 
```python
LANGUAGE_CODE = 'ko-kr'

def gettext_noop(s):
    return s

LANGUAGES = [ 
        ('ko-kr', gettext_noop('Korean')),
 ]
```

### 참고 사이트
- 참고 : https://github.com/django/django/blob/master/django/conf/global_settings.py
- django DB Query 관련: https://tech.peoplefund.co.kr/2017/11/03/django-db-optimization.html 
