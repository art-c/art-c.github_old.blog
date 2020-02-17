---
layout  : wiki
title   : 
summary : 
date    : 2020-02-11 14:25:43 +0900
updated : 2020-02-14 22:43:40 +0900
tag     : 
toc     : true
public  : true
parent  : index
latex   : false
---
* TOC
{:toc}

# 


### package.json
* 패키지 매니져.. 모듈을 설치하면 자동으로 생성.. node_modules 디렉토리가 없더라도(git push 할 때 node_module은 .gitignore에 기록됨.), package.json이 있다면 `yanr install`로 동일한 환경으로 개발 할 수 있음.


### 자바스크립트와 json

* json의 기본적인 모습
 - '{"key": "value"}' 
 - 문자열 형태를 띄나 내부 키와 값은 이중따옴표로 표시, 외부는 홑따옴표로 감싼 형태다. 위 형태는 일반적인 콘솔 출력형태고 파일저장시 다음과 같이 저장됨.
 -  {"key": "value"}
 - 위와 같이 저장된 파일을 자바스크립트에서 불러오려면 다음과 같이 하면됨.
 - JSON.parse(JSON.stringify(jsonData);
 - 가끔 json 저장형식이 다음과 같은 경우가 있다.
 - ... \"namer\": \"\\uc544\\ud2b8\\ub85d\\uc2a4", \" ... 
 - 대충 json 파일인데 \ 역슬레쉬가 많이 들어가 있다 싶으면 우선 파일용량이 뻥튀기 되어 있을 것이다. json형식으로 같이 json에 맞게 문자열화되어 있는 형식이라 따로 stringify 함수를 호출할 필요가 없다. 그냥 다음과 같이 호출
 - JSON.parse(jsonData)
 - 용량이 큰 대신 문자열화 하는 오버헤드가 없다. 대신 웹상에서 전달될 때는 용량이 더 큰 점을 감안해야함. 
 - 결국 상황에 맞게 두 가지 방식을 사용..
