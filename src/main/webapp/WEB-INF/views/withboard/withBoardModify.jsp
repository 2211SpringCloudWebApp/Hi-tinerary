<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 수정페이지</title>
<link rel="stylesheet" href="../../../resources/css/withBoardModify.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	<h1>커뮤니티/동행찾기 수정하기</h1>
	<form action="/withboard/withBoardModify" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${withBoard.boardNo }" name="boardNo">
		<input type="hidden" value="${withBoard.boardImage }" name="boardImage">
		<div id="Container" contentEditable="true">
			<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
		</div>
		<div class="oneHundred">
			<div class="infos">본문이미지첨부</div>
			<div class="filebox">
				<label for="withImage">파일찾기</label> 
				<input class="upload-name" id="upload-img" placeholder="jpg, png 파일만 선택해 주세요"> 
				<input type="file" name ="reloadFile" id="withImage">
			</div>
		</div>
		<br> 
	<input type="text" name="boardTitle" value="${withBoard.boardTitle }">
	<br>
    
	<input type="date" name="start-Date" value="<fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" />"> - 
	<input type="date" name="end-Date" value="<fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" />"><br>
	
	<br>
	<input type="range" min="1" max="10" value="${withBoard.maxPeople}" class="slider" id="myRange" name="maxPeople"> <br>
	현재인원수 / 최대 인원수: ${withBoard.currentPeople } / <span id="value">value="${withBoard.maxPeople}"</span><br>
	작성자 : ${withBoard.userNo } <br>
	<%-- 작성날짜 : ${withBoard.writeDate } <br> --%>
	<textarea rows="10" cols="30" name="boardContent">${withBoard.boardContent }</textarea>
	<br>
	<input type="submit" value="수정하기">
	</form>
	<a href="">삭제하기</a>
	<a href="/withBoard/withBoardList">목록으로</a>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
		/* range bar */
		 var slider = document.getElementById("myRange");
         var output = document.getElementById("value");
         output.innerHTML = slider.value;

         slider.oninput = function () {
             output.innerHTML = this.value;
         }
         
         /* 이미지 첨부하는 부분 */
       
		const container = document.getElementById("Container");
		const fileInput = document.getElementById("withImage");
		let imgElement = container.getElementsByTagName("img")[0];

		fileInput.addEventListener("change", function() {
			const file = this.files[0];

			// 파일이 이미지 파일인 경우
			if (file.type.match("image.*")) {
				const reader = new FileReader();

				reader.addEventListener("load", function() {
					// 이미지 파일을 삽입
					const img = document.createElement("img");
					img.src = reader.result;
					if (imgElement) {
						// 기존에 삽입된 이미지가 있다면 삭제
						container.removeChild(imgElement);
					}
					imgElement = img;
					container.appendChild(imgElement);
				});

				// 파일 내용 읽기
				reader.readAsDataURL(file);
			}
		});

	</script>
</body>
</html>