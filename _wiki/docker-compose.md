---
layout  : wiki
title   : 
summary : 
date    : 2020-05-05 10:52:17 +0900
updated : 2020-05-05 11:24:35 +0900
tag     : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}


# 옵션
https://mrchypark.github.io/post/%EB%B2%88%EC%97%AD-haproxy%EC%99%80-docker%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EB%A1%9C%EB%93%9C%EB%B0%B8%EB%9F%B0%EC%8B%B1/#fn2
	deploy:
		replicas : 20
		update-config:
			parallelism : 5
			delay : 10s
		restart_policy:
			condition: on-failure
			max_attempts: 3
			window: 120s
			
	depends-on:
		- other_service_name
		
