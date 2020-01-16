---
layout  : wiki
title   : podman
summary : podman
date    : 2020-01-16 19:05:08 +0900
updated : 2020-01-16 19:22:19 +0900
tag     : podman
toc     : true
public  : true
parent  : container
latex   : false
---
* TOC
{:toc}

# podman이란?

## port 관련

* 1podfw - create all containers in one pod (inter-container communication is done via localhost), doing port mapping in that pod
* 1pod - create all containers in one pod, doing port mapping in each container (does not work)
identity - no mapping
* hostnet - use host network, and inter-container communication is done via host gateway and published ports
* cntnet - create a container and use it via `--network container:name` (inter-container communication via localhost)
* publishall - publish all ports to host (using -P) and communicate via gateway
* 
* 1podfw - all container in one pod(내부 컨테이너는 localhost를 경우해서 통신한다.), port 매핑은 pod에 함.
* 1pod - all container in one pod, 하지만 port 매핑은 각각의 컨테이너에 대해서 함(not working)
* identity - no mapping
* hostnet - 호스트 네트워크 사용, 그리고 내부 컨테이너는 호스트의 gateway와 pubished port를 경유해서 통신한다
* cntnet - 통신을 경유할 컨테이너 하나를 만든다. `--network container:name` (내부 컨테이너는 localhost 경유해서 통신한다.)
* publishall - `-P` 옵션 호스트에 대해 모든 컨테이너가 포트를 pubished, gateway 를 경유해서 통신함.
* 
