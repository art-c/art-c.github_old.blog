---
layout  : wiki
title   : 
summary : 
date    : 2020-02-11 14:25:43 +0900
updated : 2020-07-13 13:49:19 +0900
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
> hoisting 문법 때문이다. (hoisting이란 선언을 코드의 맨 위로 끌어올려주는 기능이다., 함수의 선언 역시 마찬가지)  
> 블럭 scope를 무시한다.  
> 위 기능들은 당장은 편리할 수 있으나, 프로젝트가 커지면 문제가 될 수 있다.  
* 최근 bigint의 추가 
> 자바스크립트의 기본 숫자 범위 `-2**53 ~ 2**53`  
> bigint -> 숫자의 끝에 n을 추가  

> `const mybigint = 123123213123123123123123123123n;`  
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
> == 와 ===의 차이점  
> ==는 값이 같은지 검사, ===는 값과 타입이 같은지 검사
```javascript
a = {name: 'kk'} //object 타입 ref가 저장됨
b = {name: 'kk'}
a == b //false //a와 b는 ref가 다르기 때문에
```
```javascript
null == undefined //true
null === undefined //false
0 == fale //true
0 === false //false
'' == false //true
'' === false //false
```

> ...args  
> 여러개의 인자를 받아서 배열로 만들어준다.
`function test(...args) {` 이렇게 선언하고, `test(1,2,3,4)` 이렇게 여러 인자를 전달하면 함수 내부에서 `args=[1,2,3,4]`로 선언한 것 처럼 사용할 수 있다.

* forEach와 map의 차이점

* 모든 함수의 기본 리턴값
`return undefined`

* Early return, early exit

* 함수이름을 사용해서 디버깅 시 노출 시키기
`const myfunction = function myfunction() { ...` function다음에 함수이름을 안써도 되지만 디버깅을 위해 쓴다.

* class
> getter와 setter    

```javascript
class User {
	constructor(name, age) {
		this.name = name;
		this.age = age;  // 여기에서 age는 setter의 이름. 그리고 이 동작은 setter를 호출한다.
	}
	
	get age() {
		return this._age; // 실제 사용되는 변수는 _age
	}
	
	set age(value) {
		if (value <0) {
			throw Error('age can not be negative');
		}
		this._age = value; // this.age라고 하면 age 무한 호출. 따라서 내부 변수이름을 동일하게 사용하지 않는다.
	}
}
const user1 = new User("ju", 99);
console.log(user.age);
```

> public 과 private  
```javascript
class Test {
  name = 'juhyun'
  #privatevalue = 333;
}
```

> static  
> 클래스 이름으로 호출, 생성된 객체로 호출 못함(C++은 호출 가능하다고 기억)  

> `extends` 키워드로 상속.  
> `super` 부모 클래스를 의미함.  

> `instanceof` - 인스턴스 instanceof 클래스  -> true or false  

> `toString` 메서드 , python의 `__str__` 메서드와 비슷

> Objects  

```
const obj1 = {};   //'Object literal' syntax
const obj2 = new Object();  // 'Object constructor' syntax
```
> Property value shorhand  

```javascript
function makePerson(name, age) {
		return {
		name,
		age,
	}
}
value = makePerson("ju', 99)
//위 함수의 리턴값: {name: 'ju', age: 99}
// 아래 함수와 같이 쓸 수도 있음

// Constructor Function
function Person(name, age) {
	this.name = name;
	this.age = age
}
```

> in operator  
```javascript
console.log( 'name' in user1 ); //user1에 'name'이라는 key가 있는지.
console.log( user1.novalue ); //user1에 novalue가 없으면 undefined
```

> for..in  
```javascript
for (key in user1) {
	console.log(key	
}
```

>  for..of  
```javascript
const array = [1,2,3,4];
for(let i = 0; i < array.length; i++) {
	console.log(array);
}
//위와 동일한 for .. of 
for(value of array) {  // python에서는 in으로 다되는데..
	console.log(value);
}
```

> cloning  

```javascript  
// oldway
const user3 = {};
for (key in user) {
	user3[key] = user[key];
}
// new way
const user4 = {};
Object.assign(user4, user); 
console.log(user4);
user4 = Object.assign({}, user);// 또는 리턴값을 받아서 사용해도 된다.
//another example
const fruit1 = {color: 'red'};
const fruit2 = {color: 'blue', size: 'big'};
const mixed = Object.assign({}, fruit1, fruit2);
console.log(mixed.color); // 'color' 같이 key가 있다면 뒤에 있는 값이 덮어씌워진다.
console.log(mixed.size); //'big
```

> Array  
```Javascript
a = [1,2,3,4];
a.shift() // <- 로 이동 결과: [2,3,4]
a.unshift(99) // 앞에 추가 결과: [99,2,3,4]
```
* `unshift`와 `shift`는 `push`와 `pop`에 보다 훨씬 느리다.
* 앞에 추가하는 경우 뒤의 요소들을 모두 한칸씩 뒤로 밀어내야하므로.

> splice  

```javascript
a = [1,2,3,4]

a.splice(1,2) // index 1부터 2개를 지운다.


b = [1,2,3,4]

b.splice(1,2,3,4,5,6) // 2,3을 지우고 그 자리에 3, 4,5,6을 넣는다.

// 반환값은 지워진 값 [2,3] 배열이다.
console.log(b)// [1, 3,4,5,6, 4]
```

> concat  

> `indexOf(value)` - `value`의 `index` 알아내기, 없으면 **-1** 출력  

> `includes(value)` - `value`의 존재유무, 있으면 `true` 없으면 `false`  

> `lastIndexOf` - `indexOf`는 동일한 값중 가장 앞에 인덱스를, `lastIndexOf`는 가장 마지막의 인덱스를 반환  


* array 메소드 api
> join  

> split  

> reverse  

> splice     //배열 자체를 변경시킴

> slice(start?: number, end?: number): T[];   // 새로운 배열 반환  

> find  

```javascript
const students = [
	new Student('A', 29, true, 45),
	new Student('B', 28, false, 80),
	new Student('C', 30, true, 90),
	new Student('D', 40, false, 66),
	new Student('E', 18, true, 88),
];

const result = students.find(function (student, index) { // 콜백함수는 students의 모든 요소에 대해 각각 호출된다.
	return student.score === 90; //find함수는 콜백함수의 리턴이 true인 가장 처음 값을 반환
} )
```

> filter  

```javascript
const result = students.filter(function (student) {
	return student.enrolled;  //enrolled는 학생 클래스의 세번째 변수
} )
```

> map   

```javascript
const result = students.map(function (student) {
	return student.score * 2;  // 새로운  배열요소
} )
```

> some  
```javascript
const result = students.some(function (student) {
	return student.score < 50;  //  이 조건에 맞는 요소가 있다면 result는 true 아니면 false
} )
```


> every  
```javascript
const result = students.every(function (student) {
	return student.score < 50;  // 모든 요소가 이 조건에 맞다면 result는 true 아니면 false
} )
```

> reduce  
```javascript
a = [1,2,3,4,5]
a.reduce((pre, cur) => pre + cur); // 15 
a.reduce((pre, cur) => pre + cur, 100); // 115 
```

> reduceRight  

> sort  

### package.json
* 패키지 매니져.. 모듈을 설치하면 자동으로 생성.. node_modules 디렉토리가 없더라도(git push 할 때 node_module은 .gitignore에 기록됨.) package.json이 있다면 `yanr install`로 동일한 환경으로 개발 할 수 있음. 

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



