---
layout  : wiki
title   : vimwiki 설명
summary : vimwiki에 대한 내용
date    : 2020-01-15 17:43:07 +0900
updated : 2020-01-15 23:20:42 +0900
tag     : vimwiki
toc     : true
public  : true
parent  : vim
latex   : false
---
* TOC
{:toc}

# wimwiki란?
 
## vimwiki 설치와 활용
* vimwiki 설치 설치 
 
- 참고 사이트: `https://johngrib.github.io`
 
 위 사이트에 자세한 설명이 되어 있다. 다만 github와 연동시 몇가지 직접 설치하면서 겪은 주요한 문제점들만 정리해보면 다음과 같다.
1. 단순히 위 사이트의 [seleton](https://github.com/johngrib/johngrib-jekyll-skeleton)을  clone하면 쉽게 설치할 수 있다.
2. 수정 또는 추가해야 할 파일들 : `_config.ymal`, `utterances.json`, `package.json`, `pre-commit`, `robots.txt`   (_config.ymal과 utterances.json은 열어보면 직관적으로 수정할 내용을 알 수 있고 pre-commit은 .git/hooks/pre-commit 에 복사해 넣으면 된다. `robots.txt` 에 주소도 수정해야 사이트 등록이 가능

```sh
#!/bin/sh

./generateData.js
git add _data

```

    - git commit 시  `hook excutable` 관련 에러 : chmode 775 generageData.js 후 실행하면 된다.

1. 페이지의 이름이 곧 파일이름이며 최 상위 페이지는 index.md로 하는 것이 좋다. 따라서 모든 카테고리의 최초 parent는 index로 하도록. 문서를 만들 때 parent 항목에 이 것을 정해놓지 않으면 페이지에 상위 문서 항목이 보이지 않는 것 같다.
2. 댓글 기능은 utterances은 github app에서 설치하면 자동으로 처리된다.

3. google 검색문제, naver, google adsense, analytics 설치 문제, 사이트 등록(구글,네이버)-각 사이트 웹마스터 도구, 사이트맵 등록, RSS 등록, 
- 네이버 웹마스터에서 robots.txt 접근 못하는 문제: 검증->웹페이지 최적화->확인 == 해결
4. 네이버 웹마스터 도구 x로 표시된 문제 :
* [ ] 해결중
    * [ ] 웹페이지 설명
    * [ ] Open Graph 제목
    * [ ] Open Graph 설명
    * [ ] Open Graph 앱링크



## vimwiki 활용.


