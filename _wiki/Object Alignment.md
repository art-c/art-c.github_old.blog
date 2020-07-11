---
layout  : wiki
title   : 
summary : 
date    : 2020-07-11 16:35:56 +0900
updated : 2020-07-11 16:55:34 +0900
tag     : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# alignas(byte수)
* false sharing을 방지하기 위함
* cache 사이즈는 64byte
* 구조체 멤버 맞춤으로 캐시라인과 객체의 멤버 저장 byte가 맞지 않을 경우 alignas(32byte)과 같이 강제로 패딩을 넣어 캐라인에 맞춰줄 수 있다. 멤버 변수에 따라 32byte, 혹은 64byte 등으로 설정.

```c++
#include <iostream>

class alignas(32) Test {
public:
	void make();
private:
	char c1; //1bype
	int i4a; // 4byte
	int i4b; // 4byte
	double d8; //8byte
};
```
> 위 클래스의 객체가 메모리에서 차지하는 모습을 그려보면 멤버의 선언 순서대로,
> 1~, 4~, 8~, 16~ 24  
> 24byte가 된다. **alignas(32)**를 하지 않으면 cache라인에 맞춰지지 않으므로 false sharing 문제가 발생한다. 
