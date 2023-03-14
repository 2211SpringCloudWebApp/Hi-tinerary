<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
	<br> 
	<input type="text" name="boardTitle" value="${withBoard.boardTitle }">
	<%-- 제목 : ${withBoard.boardTitle } --%>
	<br>
	<%-- <fmt:formatDate value="${withBoard.startDate }" pattern="yy.MM.dd h시" /> ~
                <fmt:formatDate value="${withBoard.endDate }" pattern="yy.MM.dd h시" /> --%>
	시작날짜 ~ 끝날짜: ${withBoard.startDate } ~ ${withBoard.endDate }
	<br>
	<input type="range" min="1" max="10" value="1" class="slider" id="myRange" name="maxPeople"> <br>
	<!-- <span id="value"></span>명<br> -->
	<%-- 현재인원수 / 최대 인원수: ${withBoard.currentPeople } / ${withBoard.maxPeople } <br> --%>
	현재인원수 / 최대 인원수: ${withBoard.currentPeople } / <span id="value"></span><br>
	작성자 : ${withBoard.userNo } <br>
	작성날짜 : ${withBoard.writeDate } <br>
	<textarea rows="10" cols="30" name="boardContent">${withBoard.boardContent }</textarea>
	<%-- 내용 : ${withBoard.boardContent } --%>
	<br>
	<input type="submit" value="수정하기" onclick="modify()">
	</form>
	<a href="">삭제하기</a>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		 var slider = document.getElementById("myRange");
         var output = document.getElementById("value");
         output.innerHTML = slider.value;

         slider.oninput = function () {
             output.innerHTML = this.value;
         }
	</script>
</body>
</html>