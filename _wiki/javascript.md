---
layout  : wiki
title   : 
summary : 
date    : 2020-02-11 14:25:43 +0900
updated : 2020-07-08 11:51:10 +0900
tag     : 
toc     : true
public  : true
parent  : index
latex   : false
---
* TOC
{:toc}

# 

### 기본
* 자바스크립트에서 var를 사용해야하지 말고 let을 써야하는 이유.
> hoisting 문법 때문이다. (hoisting이란 선언을 코드의 맨 위로 끌어올려주는 기능이다.)
> 블럭 scope를 무시한다.
> 위 기능들은 당장은 편리할 수 있으나, 프로젝트가 커지면 문제가 될 수 있다.
* 최근 bigint의 추가 
> 자바스크립트의 기본 숫자 범위 `-2**53 ~ 2**53` 
> bigint -> 숫자의 끝에 n을 추가
> const mybigint = 123123213123123123123123123123n;
> 현지 지원되는 브라우저가 크롬 정도다.
* Symbol
> 일종의 identy를 지정하는 것 같다.
```javascript
const a = Symbol('abc');
const b = Symbol('abc');
```
> 두 변수 a, b는 같은 이름의 Symbol을 가졌지만 (a===b)는 false를 가진다.
```javascript
const a = Symbol.for('abc');
const b = Symbol.for('abc');
```
> 이렇게 하면 (a===b)는 true를 가진다.
> Symbol을 출력하려면 
```javascript
console.log(a.description) 
```
 
* 문자열 인덱싱
```javascript
myvar.charAt(0)
```

* 메모리에 값이 저장되는 방식  primitive, object
> primitive는 값 자체를 저장하는 형태
> object는 덩치가 크기 때문에 ref를 저장하는 형태

* 데이터타입의 종류
> mutable, immutable
> immutable data types : primitive types, frozen objects (i.e. object.freeze())
> mutable data types : all objects by default are mutable in JS
> 다음과 같은 이유로 immutable 데이터 타입을 사용해라
> security
> thread safety
> reduce human mistakes

* 비교연산
> - == 와 ===의 차이점
> ==는 값이 같은지 검사, ===는 값과 타입이 같은지 검사
```javascript
a = {name: 'kk'} //object 타입 ref가 저장됨
b = {name: 'kk'}
a == b //false //a와 b는 ref가 다르기 때문에
```
```
null == undefined //true
null === undefined //false
0 == fale //true
0 === false //false
'' == false //true
'' === false //false
```


### package.json
* 패키지 매니져.. 모듈을 설치하면 자동으로 생성.. node_modules 디렉토리가 없더라도(git push 할 때 node_module은 .gitignore에 기록됨.), package.json이 있다면 `yanr install`로 동일한 환경으로 개발 할 수 있음.

### 자바스크립트와 json

* json의 기본적인 모습
 > '{"key": "value"}' 
 > 문자열 형태를 띄나 내부 키와 값은 이중따옴표로 표시, 외부는 홑따옴표로 감싼 형태다. 위 형태는 일반적인 콘솔 출력형태고 파일저장시 다음과 같이 저장됨.
 >  {"key": "value"}
 > 위와 같이 저장된 파일을 자바스크립트에서 불러오려면 다음과 같이 하면됨.
 > JSON.parse(JSON.stringify(jsonData);
 > 가끔 json 저장형식이 다음과 같은 경우가 있다.
 > ... \"namer\": \"\\uc544\\ud2b8\\ub85d\\uc2a4", \" ... 
 > 대충 json 파일인데 \ 역슬레쉬가 많이 들어가 있다 싶으면 우선 파일용량이 뻥튀기 되어 있을 것이다. json형식으로 같이 json에 맞게 문자열화되어 있는 형식이라 따로 stringify 함수를 호출할 필요가 없다. 그냥 다음과 같이 호출
 > JSON.parse(jsonData)
 > 용량이 큰 대신 문자열화 하는 오버헤드가 없다. 대신 웹상에서 전달될 때는 용량이 더 큰 점을 감안해야함. 
 > 결국 상황에 맞게 두 가지 방식을 사용..

