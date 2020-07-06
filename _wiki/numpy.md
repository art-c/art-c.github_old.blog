---
layout  : wiki
title   : numpy
summary : numpy
date    : 2020-07-06 18:11:36 +0900
updated : 2020-07-06 19:08:31 +0900
tag     : numpy
toc     : true
public  : true
parent  : 데이터분석
latex   : false
---
* TOC
{:toc}

# numpy
---

* structured array
- numpy에서 pandas의 데이터프레임처럼 사용하는 방법
참고 : numpy.sort?

```python
>>> dtype = [('name', 'S10'), ('height', float), ('age', int)]
>>> values = [('Arthur', 1.8, 41), ('Lancelot', 1.9, 38),
...           ('Galahad', 1.7, 38)]
>>> a = np.array(values, dtype=dtype)       # create a structured array
>>> np.sort(a, order='height')                        # doctest: +SKIP
array([('Galahad', 1.7, 38), ('Arthur', 1.8, 41),
       ('Lancelot', 1.8999999999999999, 38)],
      dtype=[('name', '|S10'), ('height', '<f8'), ('age', '<i4')])

Sort by age, then height if ages are equal:

>>> np.sort(a, order=['age', 'height'])  
```

- structred numpy를 만들면 위와 같이 정렬까지 가능하다
- 주의할 점
- 위 예제를 보면 values와 dtype의 내부 구조가 리스트[] 형식이 아닌 ()튜플형식이다. 이 부분을 그냥 지나치면 골치아픈 에러에서 헤어나오지 못할 수 있다.
- 먼저 numpy에서 필드명과 타입을 사용하려면 위와같은 구조 [(..,..), ...]가 되어야만 하는 것 같다. 위 예에선 np.array를 사용했는데 np.array로 위와 같이 dtype을 지정하면서 [(..),..]구조를 값과 dtype에 전달하면 문제는 없었다.
- 문제발생 상황은 np.array로 [[..], ...]와 같이 내부에 튜플이 아닌 리스트 형식으로 값을 전달할 경우 데이터에 문자열 타입이 있을 때 발생했다.

```sh
invalid literal for int() with base 10:
```

- 이 문제를 해결하기 위해서 np.array 대신 np.asarry 형식을 사용하면 제대로 문자열 타입도 적용되었다.
