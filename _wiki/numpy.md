---
layout  : wiki
title   : numpy
summary : numpy
date    : 2020-07-06 18:11:36 +0900
updated : 2020-07-11 15:41:30 +0900
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

## structured array
### numpy에서 pandas의 데이터프레임처럼 사용하는 방법
참고 : numpy.sort?

```python
dtype = [('name', 'S10'), ('height', float), ('age', int)]
values = [('Arthur', 1.8, 41), ('Lancelot', 1.9, 38),
           ('Galahad', 1.7, 38)]
a = np.array(values, dtype=dtype)       # create a structured array
np.sort(a, order='height')                        # doctest: +SKIP
array([('Galahad', 1.7, 38), ('Arthur', 1.8, 41),
    ('Lancelot', 1.8999999999999999, 38)],
   dtype=[('name', '|S10'), ('height', '<f8'), ('age', '<i4')])

Sort by age, then height if ages are equal:

np.sort(a, order=['age', 'height']) 
```
** 주의: 문자열은 str이 아닌 'S1', 'S2', ...'S10'(뒤에 숫자는 바이트 수)와 같은 형식이어야 한다. 
- 접근은 pandas 데이터프레임처럼 array['column_name']으로 접근할 수 있다.
- 정렬방식은 위 코드 참고


- structred numpy를 만들면 위와 같이 정렬까지 가능하다
- 주의할 점
- 위 예제를 보면 values와 dtype의 내부 구조가 리스트[] 형식이 아닌 ()튜플형식이다. 이 부분을 그냥 지나치면 골치아픈 에러에서 헤어나오지 못할 수 있다.
- 먼저 numpy에서 필드명과 타입을 사용하려면 위와같은 구조 [(..,..), ...]가 되어야만 하는 것 같다. 위 예에선 np.array를 사용했는데 np.array로 위와 같이 dtype을 지정하면서 [(..),..]와 같은 구조를 값에 전달하면 문제는 없었다.(value, dtype을 형식에 맞게 동시 지정)
- 문제발생 상황은 np.array로 [[..], ...]와 같이 내부에 튜플이 아닌 리스트 형식으로 값을 전달할 경우, 그리고 동시에 데이터에 문자열 타입이 있을 때 발생했다.
` invalid literal for int() with base 10:`
-  추측해보건데 이 문제는 넘파이가 수치형 데이터에 특화되어 있기에 ...아직 잘 모르겠다.
- 이 문제를 해결하기 위해서 np.array 대신 np.asarry 형식을 사용하면 제대로 문자열 타입도 적용되었다.
** 추가: np.asarry를 사용할 때 이미 dtype이 정해진 array에 적용하려면 위에 열거한 것과 동일한 문제가 다시 발생하므로, 만약 여러 structured array를 합치는 작업을 한다면 합치기 전에 개별 array들의 dtype을 맞게 적용해줘야 한다. 이렇게 하면 합칠 때 굳이 dtype을 적용하지 않아도 된다.


### numpy 배열에서 values_counts와 비슷하게 사용하는 방법
[[https://stackoverflow.com/questions/10741346/numpy-most-efficient-frequency-counts-for-unique-values-in-an-array | 참고]]
```
value, counts = np.unique(array, return_counts=True)
```

### numpy 에서 one hot encoding하기
```python
np.eye(num)[target]
```
- num은 차원을 말하며 target은 0~num 사이의 값이다. 예를들어 'apple', 'banana', 'orange' 이렇게 세계의 카테고리 변수를 원핫인코딩할 때 각각 0, 1, 2에 대응시켜 target으로 만들어 원핫인코딩하면 된다.

