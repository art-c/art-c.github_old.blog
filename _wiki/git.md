---
layout  : wiki
title   : git
summary : git
date    : 2020-01-19 21:40:24 +0900
updated : 2020-02-13 10:15:18 +0900
tag     : git
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

#

## git 설치
* centos7
```
rpm -Uvh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
sudo yum install git
```
## pre-commit
* `.git/hooks/pre-commit` 에 작성, `chomd 755 pre-commit` 필요
* git 1.8 버전에서는 `pre-commit` 실패시 메세지 없음, git 2.x로 업그레드 추천.
	 
## 상황
* 보통 remote가 github면 github가 upstream임(source 근원). local에서 clone해서 수정하다가 새로운 branch를 만들어 checkout하여 commit한 상황. 이 상황은 local에 새로운 branch가 생성되어 upstream(github)에는 정보가 없는 상황. 새로운 branch에 대해 github를 upstream으로 만들기 위해서 다음과 같이 push하면됨.
`git push --set-upstream origin newBranch`
	- 생각할문제:새로운 branch를 push할 때 upstream 지정을 안한다면?(github상에선 branch와 detach된 상태가 되는 것 같은데...)
* `git push origin branchName`에서 `git push`만 하면 현재 branch가 push 된다. 
	- 생각할문제:push는 명시하는 branch에 대해서 하는 것인가?, 다른 branch를변경했더라도 push 명시한 branch만 push되는 건가?

## Detatched HEAD
* HEAD는 현재 작업중인 곳을 말한다.
* HEAD는 기본적으로 브랜치를 가리킨다. 브랜치는 커밋을 가리킨다.
 - commit <- Branch  <- HEAD   
* checkout을 브랜치로 하면 문제없다. 그런데 checkout을 commit으로 직접하면 detached HEAD가 된다.
 - commit  <- HEAD   (detatched HEAD)
* 관련 사이트 (https://beam307.github.io/2019/01/15/git-HEAD/)

