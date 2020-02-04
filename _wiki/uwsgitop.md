---
layout  : wiki
title   : uwsgitop
summary : top과 같은  uwsgi 모니터링 도구
date    : 2020-02-04 12:16:29 +0900
updated : 2020-02-04 13:46:14 +0900
tag     : uwsgitop
toc     : true
public  : true
parent  : uwsgi
latex   : false
---
* TOC
{:toc}

# uwsgitop(https://github.com/xrmx/uwsgitop)

```
uwsgi-2.0.18 - Tue Feb  4 12:19:18 2020 - req: 30 - RPS: 0 - lq: 0 - tx: 141.5K
node: 172.18.0.2 - cwd: /srv/LOL/lolPredict - uid: 1000 - gid: 0 - masterpid: 4478
 WID    %       PID     REQ     RPS     EXC     SIG     STATUS  AVG     RSS     VSZ     TX      ReSpwn  HC      RunT    LastSpw
 4      66.7    4492    20      0       0       0       idle    123ms   0       0       95.3K   1       0       2019.496
 2      26.7    4490    8       0       0       0       idle    476ms   0       0       36.5K   1       0       4728.549
 3      6.7     4491    2       0       0       0       idle    56ms    0       0       9.7K    1       0       221.289 12:12:5
 1      0.0     4489    0       0       0       0       idle    0ms     0       0       0       1       0       0.0     12:12:5
 ```
 - 해석은 위 github 사이트에 잘 나와있음. 또는 (https://pydigger.com/pypi/uwsgitop)

### 설치(Installation)

``` pip install uwsgitop ```

### 설정(configration)
* uwsgitop 공식사이트에 잘 나와 있음(https://github.com/xrmx/uwsgitop). 여긴 [uwsgi문서](https://uwsgi-docs.readthedocs.io/en/latest/WSGIquickstart.html)
* 이 글의 설명은 django와 uwsgi가 기본적으로 연동이 되어 있는 상태에서 시작하는 문서임.
* uwsgi 서버 시작시에 uwsgitop을 사용한다고 알려주는 옵션을 추가해주면 끝.
1. 직접 실행시 예
  `uwsgi --http :9090 --wsgi-file foobar.py --master --processes 4 --threads 2 --stats 127.0.0.1:9191`
  - 설명 : `--stats 172.0.0.1:9191`이 설정부분.  `uwsgitop`을 해당 `주소:포트`에서 사용한다는 뜻. 소켓을 사용할 수 도 있음.
2. ini파일에 설정 예
  - 

### 사용방법

`uwsgitop ip:port`


### http 설정법
- pass




