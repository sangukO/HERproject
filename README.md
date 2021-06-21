# HER Project

>Hospital Emergency Room
>
>Inquire available hospital bed information
>
>가용 병상 정보 조회 웹사이트

2020년도 2학년 2학기에 진행한 개인 프로젝트로 해당 학기 과목인 JSP를 선택하여 호스팅을 제외한 개발 목표를 모두 구현 완료했습니다.

포스트 코로나 시대에 맞춰 병원과 응급실의 가용 병상 정보를 조회할 수 있는 웹사이트 개발을 목표로 하였으며
지역의 위치를 검색하면 해당 위치 주변의 병원, 응급실의 목록과 가용 병상 정보를 출력하고, 병원을 클릭 시
해당 병원의 위치를 카카오맵 지도로 출력하여 볼 수 있게 했습니다.

또한 게시판을 구현하여 회원들이 서로 병원에 대한 경험을 공유할 수 있게 하고,
병원명 말머리를 통해 병원 이름별로 게시글을 검색할 수 있게 구현했습니다.

## 프로젝트 진행 기간

2020 . 09 . 02  - 2020 . 12 . 16

## 개발 환경

```sh
Windows 10
JSP (jdk 1.8.0_251)
MySQL 5.7.18
Eclipse IDE 4.16.0 (2020-06)
Apache Tomcat 9.0
```

## 주차별 진행 내역
* 8주차 이전
  * 주제 선정
  * 개발 환경 구축
* 8주차
  * 로그인 페이지 구현 (기능 x)
* 9주차
  * 회원가입 페이지 구현
  * DB 연동 후 로그인, 회원가입 기능 구현
* 10주차
  * 세션 관리를 통한 로그아웃 기능 구현
  * 메인 페이지 구현 (기능 x)
* 11주차
  * 가용 병상 정보 API 파싱 50% 성공
* 12주차
  * 게시판 테이블 생성 및 게시판 기능 구현 (작성, 수정, 삭제)
* 13주차
  * 가용 병상 정보 API 파싱 성공
  * 메인 페이지 주소 검색 기능 구현
* 14주차
  * 페이지 모듈화 오류, iframe으로 인라인 프레임 구현
* 15주차
  * 카카오맵 API를 사용하여 병원 위치를 지도로 출력
  * 병원 이름별 검색 기능 구현
* 16주차
  * 최종 프로젝트 완료 보고서 제출 및 완료 발표, 시연

## 스크린샷

메인화면

![메인화면](https://user-images.githubusercontent.com/71215834/122802284-25a58f80-d300-11eb-821d-e552fd355bc1.png)

회원가입

![회원가입화면](https://user-images.githubusercontent.com/71215834/122802292-276f5300-d300-11eb-9d65-ea5e16e9f7c6.png)

로그인

![로그인화면](https://user-images.githubusercontent.com/71215834/122802298-28a08000-d300-11eb-9757-12d8be5d9fbc.png)

주소 검색

![주소검색](https://user-images.githubusercontent.com/71215834/122802290-276f5300-d300-11eb-9b0b-50cf72836642.png)

병원 지도 출력

![병원지도](https://user-images.githubusercontent.com/71215834/122802288-26d6bc80-d300-11eb-8069-8dbaced755ec.png)

게시판

![게시판](https://user-images.githubusercontent.com/71215834/122802294-2807e980-d300-11eb-8240-a4e282973145.png)

게시판 검색 : `현대유비스병원`

![게시판검색](https://user-images.githubusercontent.com/71215834/122802295-2807e980-d300-11eb-87cf-ada83d248c21.png)

## 정보
오상욱 / woqls1972@gmail.com

_db 관련 정보와 API KEY는 수정하여야 합니다._
