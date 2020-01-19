---
layout  : wiki
title   : postgresql12
summary : postgresql12
date    : 2020-01-19 20:41:57 +0900
updated : 2020-01-19 20:47:30 +0900
tag     : db, databse
toc     : true
public  : true
parent  : databse
latex   : false
---
* TOC
{:toc}

# postgresql12

## 에러

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

