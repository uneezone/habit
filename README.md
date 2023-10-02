## ITWILL 팀 프로젝트(HABIT)
![Generic badge](https://img.shields.io/badge/jstl-1.2-yellowgreen.svg) ![Generic badge](https://img.shields.io/badge/apacheTomcat-9.0.58-green.svg) ![Generic badge](https://img.shields.io/badge/mariaDB-10.6.14-orange.svg) ![Generic badge](https://img.shields.io/badge/springBoot-2.7.5-blue.svg)

<p align="center"><img src="https://github.com/uneezone/habit/assets/76038673/e2305126-7520-4f45-ad8d-1e6c7e8f1164" height="200px" width="300px"></p>



### 🔗라이브
[HABIT.site](http://43.201.111.116:8080/) 

### ✈️ 소개
해빗(HABIT)은 사람들에게 다채로운 취미 여가 생활을 제안하여 누구나 즐거운 세상을
경험하고 삶을 탐험 할 수 있는 환경을 만들고 있습니다.

취미 및 여가 액티비티 플랫폼으로 개설 할 프로그램(원데이 클래스, 회원권 등)을
보유한 호스트와 참여자를 연결하는 서비스입니다.

### 🛠 기능 요약
1. 이용자가 회원 가입을 하여 호스트가 개시한 프로그램을 카테고리 및 필터를 사용하여 개인의 취향껏 볼 수 있습니다. 또한 기존에 이용한 사용자의 리뷰 확인이 가능합니다.
2. 개시된 프로그램은 호스트가 설정한 "날짜 조율형/날짜 지정형" 옵션 창을 통해 확인할 수 있습니다.
3. 호스트는 종료된 프로그램을 통해 판매 관리 및 리뷰 요약 대시보드 확인이 가능하며, 정산 이용이 가능합니다.

### ⏰ 개발 기간
- 프로젝트 : 2023년 5월 31일 ~ 2023년 07월 03일

### 👩‍💻 멤버 구성
- 김태윤(팀장)
- 박해빈
- 안선화
- 오루하
- 박요셉

### 📌 기술 
- HTML, CSS, JavaScript, Ajax, Java, jQuery, jsp
- Spring-boot, apache-tomcat, aws RDS, mariaDB

### 📌 API
1. KAKAO MAP (프로그램 상세페이지 API)
2. PortOne (결제 페이지 API)
3. SummerNote (프로그램 등록페이지 API)

### 📌 주요 기능 
✔ 인트로 페이지 (로드 시 팝업 모달창 활성)
<br>
✔ 페이지 상단 호스트 페이지, 카테고리, 회원가입/로그인, 찜, 장바구니, 마이페이지 활성화
<br>
✔ 인트로 상품 정렬은 전체 조회순, 전체 평점순, 전체 등록순에 TOP4만 지정



![주요화면1](https://github.com/uneezone/habit/assets/76038673/a4250aac-5cf3-46d5-b3ab-00a7736563b9)

<hr>

✔ 선택한 카테고리를 가져오면 요약 리스트로 이동
<br>
✔ 요약 리스트에서 "중분류" 분류 및 "필터" 버튼 모달 출력 / 선택한 카테고리 클릭시 카테고리 모달창 출력
<br>
✔ 요약 페이지 하단에 전체 페이지로 이동  


![주요화면 2](https://github.com/uneezone/habit/assets/76038673/56e2f5e9-3935-41fe-9561-a442f504fcbc)

<hr>

✔ 상품 상세페이지에서 리뷰 요약 리스트, 진행 장소 API, 상품, 상품 설명, 해시 태그 구현
<br>
✔ 페이지 하단에 참여하기 버튼 클릭시 옵션 모달창 생성 하여 이용자가 옵션 종류 선택 및 수량 선택 가능


![image](https://github.com/uneezone/habit/assets/76038673/731944b3-1e8c-4344-bd44-7834fc377573)

<hr>

✔ 옵션 선택시 장바구니 페이지 이동하여 최종 선택 시 결제 페이지 이동
<br>
✔ 결제 페이지에서 회원이 보유한 에너지(포인트) 사용 가능
<br>
✔ 결제하기 클릭시 결제 API 활성  


![image](https://github.com/uneezone/habit/assets/76038673/bb281412-83d6-4e0e-94ad-5e48ff455a68)

<hr>

✔ 결제 완료 이후 마이페이지에서 결제 내역 (주문 상세, 환불) 확인 가능
<br>
✔ 리뷰 쓰기도 가능하지만 프로그램 사용 이후 작성 가능  


![image](https://github.com/uneezone/habit/assets/76038673/c220c5bf-ddf8-467e-bbf1-8b5b441fbe2d)

<hr>

<span style='background:#F7DDBE'><strong>💡 HOST </strong></span>
<br>
✔ 모든 유저는 호스트 가입이 가능하며 완료시 관리 페이지 이동
<br>
✔ 호스트가 등록한 상품 판매 현황 확인 가능  


![image](https://github.com/uneezone/habit/assets/76038673/2a8a065a-e4bf-49e6-b786-3be77f8bf780)

<hr>

✔ 호스트가 올린 해빗(프로그램)을 필터, 검색으로 조회 가능
<br>
✔ 해빗(프로그램) 등록이 가능하며, 상품 설명은 API 사용


![image](https://github.com/uneezone/habit/assets/76038673/373a7652-3d0c-4d8e-a789-4140283c8816)

<hr>

✔ 판매 유형(날짜 지정형 / 날짜 조율형)에 따른 예약 페이지가 따로 존재하며 판매 상태 변경 가능
<br>
✔ 리뷰 관리 페이지에서 별점, 회원 아이디, 내용에 따른 상세 조건 검색 가능  


![image](https://github.com/uneezone/habit/assets/76038673/d8cf5a72-d64a-4d27-86a1-d83872d2da8c)

<hr>

✔ 정산 페이지에서 기간 필터 설정을 하여 조회 가능
<br>
✔ 여러가지 프로그램을 등록하였다면 행 별로 검색값이 나오며 행 클릭시 상세 모달창 활성  


![image](https://github.com/uneezone/habit/assets/76038673/2adc0eeb-ccd4-4fb1-8100-5ba2cd890c36)


