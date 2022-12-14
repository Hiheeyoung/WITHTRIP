# 🛫WITHTRIP🛬
## 📃개요
+ 프로젝트 명: WITHTRIP
+ 프로젝트 기간 : 2022년 06월 21일 ~ 2022년 07월 13일
+ 프로젝트 참여 인원 : 7명
+ 개발 목적 : 리뷰를 통한 동행의 신뢰도 확인, 여행 취향이 같은 동행 찾기 및 여행 용품 판매 사이트 제작
+ 개발 환경
  + O/S : Windows 10
  + Server : Apache-tomcat 9.0.62
  + IDE : Spring Tool Suite3
  + Database : Oracle SQL Developer 11g
  + Language : Java 1.8, HTML, CSS, JavaScript, JSP, SQL
  + Framework/flatform : Spring 5.3.20, myBatis 3.5.6, jQuery 3.6.0, Bootstrap, maven 3.8.5
  + API : WebSocket, Kakao 우편번호 서비스, Kakao 소셜 로그인, tawk.to, i’mport
---------------------
## ✏구현 기능
  + 여행 용품 게시판(상점) CRUD
  + 구매한 물품 후기(댓글) CRUD
  + i’mport api를 활용하여 결제 및 환불 기능 구현
---------------------  
## 💻구현 기능 상세
### 여행 용품 판매(상점) 게시판
####  &nbsp;&nbsp;1. 여행 용품 게시글 조회
<img src="https://user-images.githubusercontent.com/110291925/182152087-2056c577-88be-4189-9f4d-a1879ac57d40.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 판매 중인 여행 용품 전체 조회 페이지
    - 페이징을 적용하여 게시글이 9개가 넘어가면 다음 페이지로 목록 이동
    - 관리자 계정으로 로그인한 경우에만 글쓰기 버튼이 보이며 관리자인 경우에만 글 작성/수정/삭제가 가능
    - 상단의 카테고리 클릭 시 해당 카테고리에 해당하는 용품 조회
    - 찾고싶은 상품을 상품 명으로 검색(엔터키로 검색)
    - 오른쪽 상단의 품절 상품 제외 버튼 클릭 시 품절된 상품을 제외한 상품 목록 확인 가능
        
        → 현재 url을 비교하여 보여지는 버튼을 다르게 구현
        
    - 상품 목록 바로 위의 탭에서 총 상품 개수 확인 및 상품을 신상품, 판매량, 낮은가격, 높은가격 순으로 조회 가능
        
        → 상품 목록을 Ajax로 호출하여 화면의 일부분만 변경되도록 구현, 페이징 처리도 Ajax로 구현
---
####  &nbsp;&nbsp;2. 여행 용품 판매 게시글 작성
<img src="https://user-images.githubusercontent.com/110291925/182147685-8da3c4a5-69f5-41fd-81c2-a8796c3f49bf.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 상품 카테고리를 선택하여 게시글 작성
    - 모든 내용을 작성하지 않고 등록 버튼 클릭 시 비어있는 내용을 작성하라는 alert창이 뜨고 확인 클릭 시 해당 칸으로 focus가 이동
    - 취소 버튼 클릭 시 글 목록으로 이동
    - 글 작성 완료 후 등록 버튼 클릭 시 상품 상세보기 페이지로 이동
---
####  &nbsp;&nbsp;3. 여행 용품 판매 게시글 수정
<img src="https://user-images.githubusercontent.com/110291925/182147418-f875fad7-3a44-49a0-8d53-d819f73a58d0.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 글 작성 시 입력했던 데이터를 DB에서 조회하여 해당되는 입력 칸에 맞게 내용이 입력되어있도록 함
    - 첨부파일 변경 없이 등록 버튼을 클릭하면 이전에 첨부한 파일 출력
    - 글 수정 후 등록 버튼 클릭 시 수정 내용 확인이 가능하도록 해당 글의 상세페이지로 이동
---
####  &nbsp;&nbsp;4. 여행 용품 판매 게시글 삭제
<img src="https://user-images.githubusercontent.com/110291925/182147105-7e9d66fd-5937-469a-9701-8413d05338fc.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 삭제 버튼 클릭 시 alert 창을 출력하여 삭제할 것인지 한 번 더 확인
    - alert 창에서 확인 버튼 클릭 시 DB에 저장된 글과 첨부파일의 상태가 삭제 상태로 변경
    - 글 삭제 완료 시 게시글 목록으로 이동
---
### 여행 용품 후기(댓글)
####  &nbsp;&nbsp;1. 댓글(리뷰) 목록 조회
<img src="https://user-images.githubusercontent.com/110291925/182151456-e39d2486-788e-42a0-b2d4-27726171184d.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 상품 구매 후기(댓글) 목록 조회(각 상품의 상세보기 페이지 하단에 위치)
    - 첨부 사진 클릭 시 사진 확대
    - 본인이 쓴 후기만 수정, 삭제 가능
    - 관리자의 경우 회원의 부적절한 댓글 삭제 가능
---
####  &nbsp;&nbsp;2. 댓글(리뷰) 작성
<img src="https://user-images.githubusercontent.com/110291925/182148254-46ec81fc-6ce2-4fa4-be69-a11424f5493a.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 후기 댓글은 로그인이 되어있는 경우에만 작성 가능
    - 사진은 최대 3장까지만 첨부할 수 있도록 하였고 첨부파일의 형식은 jpg, jpeg, png 형식만 등록 가능하도록 구현
    - 후기 작성은 최대 150자 까지 가능하며 그 이상 입력할 시 alert창이 출력되며 초과된 내용은 삭제됨
    - 후기 작성 버튼 클릭 후 바로 댓글 목록 조회가 가능하도록 구현
---
####  &nbsp;&nbsp;3. 댓글(리뷰) 수정
<img src="https://user-images.githubusercontent.com/110291925/182148175-a3bfbff2-b58a-4769-b8c1-f6588d94e1f4.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 수정 버튼 클릭 시 버튼이 등록 버튼으로 바뀌며 기존 내용이 담긴 수정 내용 칸이 출력됨
    - 내용 수정 후 등록 버튼 클릭 시 버튼이 다시 수정 버튼으로 바뀌며 수정된 내용과 수정 일자출력
---
####  &nbsp;&nbsp;4. 댓글(리뷰) 삭제
<img src="https://user-images.githubusercontent.com/110291925/182148118-d422f548-bf59-41fa-afea-44df8541b286.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 삭제 버튼 클릭 시 삭제 확인 alert창이 출력되며 확인 클릭 시 해당 댓글 삭제
    - 삭제된 댓글은 DB에서 삭제 상태로 변경됨 
---
### 결제 / 환불
####  &nbsp;&nbsp;1. 상품 결제
<img src="https://user-images.githubusercontent.com/110291925/182147900-3f741f6d-2e04-421b-8fd2-1f0f850d01ae.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 배송지 변경 버튼 클릭 시 카카오 api로 주소 검색 가능
    - 결제 화면에서 결제하기 버튼 클릭 시 i’mport 결제 api가 호출되며 결제 진행
    - 결제 성공 시 DB에 결제 정보 저장
    - 결제 성공 후 “결제가 완료되었습니다”라는 alert창 출력, 결제 내용을 확인할 수 있는 결제 완료 페이지로 이동
---
####  &nbsp;&nbsp;2. 구매 상품 환불
<img src="https://user-images.githubusercontent.com/110291925/182148041-ca17d786-3558-4efe-b1ce-c7fa87a1e65b.gif" width="800" height="600"/>


  - **구현 기능 설명**
    - 마이페이지-주문내역에서 주문취소 버튼 클릭 시 i’mport 결제 api를 호출하여 환불 진행
    - 환불이 완료되면 주문 취소 및 환불 완료 안내 alert창이 출력되며 확인 버튼 클릭 시 주문취소 버튼이 환불 완료로 변경됨-환불 완료 클릭 시 환불 영수증 확인 가능
    - 환불 성공 시 DB에 환불 정보 저장

