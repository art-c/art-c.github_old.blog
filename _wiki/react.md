---
layout  : wiki
title   : 
summary : 
date    : 2020-02-11 14:23:51 +0900
updated : 2020-02-18 21:08:12 +0900
tag     : 
toc     : true
public  : true
parent  : index
latex   : false
---
* TOC
{:toc}

# 
 
 
### tagged 템플릿 리터럴


### redux : crome 확장 도구 사용법
1. 크롬 redux DevTools 설치
2. index.js에서 store 설정시 다음과 같이 설정
 
```
...
import rootReducer from "./modules";

const store = createStore(
  rootReducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
)
```
- 문제 : middleware 사용시 에러발생
