#!/bin/sh

if [ $# -eq 0 ];then
    echo hint:need commit message;
    exit
fi

git add --all

# $@를 그냥 넣게 되면 하나의 문자열로 통함되지 않아서 git 명령 인자가 여러개가 되버린다. 그래서 vlaue 변수로 한번 받아서 사용했음.
value=$@
git commit -m \"$vlaue\"

git push -u origin master

