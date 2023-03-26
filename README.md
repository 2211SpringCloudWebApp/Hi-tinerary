# 🧳 Hi-tinerary : 여행 커뮤니티
<img src= "https://user-images.githubusercontent.com/119032753/227706360-179b94f1-6b9b-4c5c-8378-4b31ea084382.png" width="1000" height="250">


# 💬 프로젝트 소개
국내 여행에 집중한 여행 커뮤니티이고, 여행자들이 실시간으로 정보를 주고 받으며 사용할 수 있는 플랫폼으로써 기능하는 동시에, 
기업회원들에게는 양질의 패키지 혹은 투어 상품을 홍보 및 판매할 수 있는 게시판을 제공하여 잠재적 여행자들의 흥미도 이끌어낼 수 있는 사이트입니다.
그리고 국내 여행지에 대한 수요가 늘어남으로써 재조명된 여려 여행지들과 여행자들을 쉽게 연결해주고 정보 습득에 용이하게 합니다.

# 📆 개발 기간
```
2023-02-27 ~ 2023-03-24
```

# 🧑‍🤝‍🧑 팀원 소개 
<img src="https://user-images.githubusercontent.com/119032753/227710763-878b3f6f-fc38-4f4c-ae45-90207e79523c.png" width="1000">

# 💻 개발 환경 
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"> <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=for-the-badge&logo=Visual Studio Code&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> <img src="https://img.shields.io/badge/MyBatis-black?style=for-the-badge&logo=Apache MyBatis&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

# ⚙️ 기술 스택
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">

# 🔨 주요 기능 및 상세
### 1. 회원 관리
|기능|내용|
|:---:|:---:| 
|회원가입|일반회원과 기업회원으로 나누어서 가입이 가능합니다. 일반회원은 기본적인 정보(아이디, 비밀번호, 이름, 닉네임, 이메일, 휴대폰번호, 생년월일, 성별)를 입력하여 회원가입을 진행합니다. 각 입력 정보마다 유효성 검사를 한 뒤 회원가입이 가능합니다.|

### 2. 투어 상품 게시판
|기능|내용|
|:---:|:---:| 
|회원가입|회원가입하는 화면입니다.|

### 3. 동행 게시판
|기능|내용|
|:---:|:---:| 
|동행 게시판|여행 mate를 찾기 위해 보여지는 부분이고, 썸네일, 제목, 여행기간, 작성자, 모집인원을 보여주는 부분입니다. 기간이 지난 글에는 음영처리를 했습니다.글 작성, 글 수정, 신고가 가능합니다.|
|댓글|참여하고 싶은 게시글에 들어가서 댓글/대댓글을 작성이 가능하고, 게시글 작성자는 댓글 단 회원들을 초대가 가능합니다. 마이페이지에서 그룹 게시판을 통해 그룹을 먼저 생성한 뒤 댓글로 돌아와서 초대 버튼을 눌러 생성한 그룹으로 초대를 할 수 있습니다.|
|페이징|한 페이지 당 작성글이 9개씩 보여주도록 했습니다.|

### 4. 자유 게시판
|기능|내용|
|:---:|:---:| 
|자유게시판|질문,잡답을 할 수 있는 곳이고, 글 작성, 수정, 삭제, 신고가 가능합니다. 카테고리 별로 출이 가능합니다.|
|질문|질문을 선택해서 글을 작성을 하고 다른 회원이 댓글을 달아주면 해당 게시글을 작성한 작성자가 채택하기라는 버튼을 누르면 답변대기로 되어있던게 답변완료로 변경이 됩니다. 답변을 채택을 하면 채택하기 버튼이 비활성화가 됩니다.|
|댓글|댓글과 대댓글 작성이 가능하고 여러명이 작성이 가능합니다.|
|페이징|한 페이지당 10개의 개시물을 보여주도록 처리했습니다.|


### 5. 마이페이지(일반회원, 기업회원, 관리자)
5_1. 일반회원 마이페이지
|기능|내용|
|:---:|:---:| 
|내 정보 조회|회원이 가입한 정보를 볼 수 있고 수정과 탈퇴가 가능합니다.|
|상품 구매 내역 조회|투어 상품에서 구매한 상품을 조회와 구매 취가 가능합니다.|
|작성 글 조회|회원이 동행구하기, 자유게시판에 작성한 글을 조회할 수 있습니다.|
|작성 댓글 조회|회원이 동행구하기, 자유게시판에 작성한 댓글/대댓을 조회할 수 있습니다.|
|그룹페이지|동행게시판에 글을 작성 후 마이페이지에서 그룹페이지로 들어와서 그룹을 생성할 수 있습니다. 그룹명, 시작날짜, 종료날자, 시간, 최대인원(2명이상)을 작성하여 그룹이 생성이 가능합니다. 그룹을 생성을 한 뒤 게시물에서 작성했던 댓글 들에서 초대 버튼을 눌러 초대를 하면 초대가 됩니다. 인원조회가 가능하고 내보낼 수도 있으며, 게시글도 작성이 가능합니다.|
|타임캡슐|타임 캡슐은 여행이 끝난 뒤 무제한으로 작성이 가능하며,  여행이 끝난 날짜 기점으로 3일 뒤에 그룹 버튼이 노랑색으로 변경이 되며 그룹에 있었던 누구든 버튼을 누르면 타임캡슐이 각자 가입했었던 이메일로 전송이 됩니다.|

5_1. 기업회원 마이페이지
|기능|내용|
|:---:|:---:| 
|내 정보 조회|기업 회원이 가입한 정보를 볼 수 있고 수정과 탈퇴가 가능합니다.|
|판매내역 조회|일반 회원이 어떤 상품을 구매했는지 보여줍니다.|
|작성글 조회|투어 상품에서 기업회원이 작성한 글을 볼 수 있습니다.|
|작성 댓글 조회|투어 상품과 자유게시판에서 기업회원이 작성한 댓글을 조회할 수 있습니다.|

5_1. 관리자 마이페이지
|기능|내용|
|:---:|:---:|
|일반회원 조회|일반회원이 가입했던 아이디, 비밀번호, 이름, 닉네임, 메일주소, 전화번호, 생년월일, 성별을 조회 할 수 있고, 삭제가 가능합니다.|
|기업회원 조회|기업회원이 가입했던 아이디, 비밀번호, 사업자명, 사업자등록번호, 메일주소, 전화번호를 조회 할 수 있고 삭제가 가능하며, 기업회원이 탈퇴를 희망하면 관리의 승인을 거쳐 탈퇴를 할 수 있습니다. 그리고 투어상품에 글을 작성할 때 관리자가 권한을 부여해주어야 글 작성이 가능합니다.|
|신고 게시글 조회|투어게시판, 동행게시판, 자유게시판에서 신고를 한 목록들을 보여줍니다.|
|신고 글 조회|투어게시판, 동행게시판, 자유게시판에서 신고를 한 댓글을 보여줍니다.|

# 📽️ 실행 화면
### 1. 메인화면
<img src="https://user-images.githubusercontent.com/119032753/227711054-eb3c95eb-1f1a-4c22-894c-8489deb964ec.png" width="1000" height="800">

### 2. 로그인
<img src="https://user-images.githubusercontent.com/119032753/227711162-6ed0cc1d-313b-4905-9533-f9f6bb6df9df.png" width="1000" height="600">

### 3. 회원가입
<img src="https://user-images.githubusercontent.com/119032753/227711312-79c71285-f6c4-445b-801e-c5b10231a848.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227717486-1d321329-427e-4248-8c1b-9a4c4acc3293.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227717646-f5bf023e-a429-4011-b965-1a9e3e0ae5fd.png" width="1000" height="600">

### 4. 투어상품
<img src="https://user-images.githubusercontent.com/119032753/227717786-9cc3ed4c-66b5-46b8-a968-792a44976c6e.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227717876-3dd528fe-ac11-4b2b-adc1-8475efa6d46c.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227717969-6e72e78b-86fc-4ba0-9213-f332d30c9fd8.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227718095-6f78c026-2317-45c2-8d79-6b3b7aae5f1f.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227718209-d87e82aa-02b2-4f77-b2b9-84bd4472acc1.png" width="1000" height="600">

### 5. 동행구하기
<img src="https://user-images.githubusercontent.com/119032753/227718295-cdc8c370-9884-48a1-8f2c-b300e4fda65b.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227718361-6cb21f32-8ee9-4d70-92d8-d1884031be43.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227718582-2d430a00-5e68-41a2-a996-1f354f8d51f5.png" width="1000" height="600">

### 6. 자유게시판
<img src="https://user-images.githubusercontent.com/119032753/227718661-2fc734b6-1a50-4df6-93d0-abe8b9040e79.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227718799-840dd8fa-f410-44ef-88fc-b842853b6a47.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227719257-05932df7-dc29-46a9-b07a-358970e38f16.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227719122-e5df5532-7a59-43e6-aeea-4c0d0c786550.png" width="1000" height="600">

### 7. 마이페이지

7_1. 일반회원 마이페이지
  
<img src="https://user-images.githubusercontent.com/119032753/227719443-4c72d1f4-304c-4e11-86d4-1d306b8456aa.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227719961-9e7770a4-b9ce-4c92-99bb-aaa98a8539c1.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227719980-fdf829ca-c70e-4fc9-8361-d736c482d539.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227719983-77cfeded-d9fb-43f7-ac1f-74f0e8c41b03.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720131-ff8df345-848d-415c-b3d7-2a90946d072f.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720190-be603468-0985-47b7-a811-8dfeb8d93a4a.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720263-4c504d23-a760-470f-aad5-54f105f729bc.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720384-967b54a7-93b2-4bac-a2fb-ca07f758984a.png" width="1000" height="600">

7_2. 기업회원 마이페이지

<img src="https://user-images.githubusercontent.com/119032753/227720593-5e007a61-0825-44ab-86ba-a91b168e9546.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720656-59aacf17-889c-49b6-a90b-7d0825313799.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720711-3dbaff4c-61ec-459d-9ae0-e2e865dbcf61.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720815-f8166bca-1224-4e2f-935c-e3ffd34c68ca.png" width="1000">

7_3 관리자 마이페이지

<img src="https://user-images.githubusercontent.com/119032753/227720922-cdce156d-e88d-4062-b939-8c0b8af7e270.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227720975-7f372977-fb4a-44a8-afa2-c43eec36b8ad.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227721057-a052891f-882e-4810-93af-9412b80af106.png" width="1000" height="600">
<img src="https://user-images.githubusercontent.com/119032753/227721108-22e7f67e-250d-4510-8337-f9f7895330a6.png" width="1000" height="600">
