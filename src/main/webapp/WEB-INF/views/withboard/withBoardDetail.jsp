<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>동행찾기 게시판 상세페이지</title>
<link rel="stylesheet" href="../../../resources/css/withBoardDetail.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	<%-- <h1>커뮤니티/동행찾기</h1>
               <img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}"><br>
                제목 : ${withBoard.boardTitle }<br>
                <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~
                <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" /><br>
                현재인원수 / 최대 인원수: ${withBoard.currentPeople } / ${withBoard.maxPeople }<br>
                작성자 : ${withBoard.userNo }<br>
                작성날짜 : ${withBoard.writeDate }<br>
                내용 : ${withBoard.boardContent } <br> --%>
                
	<main id="withBoardDetail">
		<div id="withTitle">
			<div id="bar_title"></div>
			<p>커뮤니티</p>
		</div>
		<div id="withSubTitle">
			<div id="bar_subtitle"></div>
			<p>동행찾기</p>
			<button onclick="location.href='/withboard/withWriteView'">글쓰기</button>
		</div>

		<div id="thumbnailAndInfos">
			<div id="thumbnail">
				<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
			</div>
			제목 : ${withBoard.boardTitle }<br>
			 <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~
                <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" /><br>
                현재인원수 / 최대 인원수: ${withBoard.currentPeople } / ${withBoard.maxPeople }<br>
                작성자 : ${withBoard.userNo }<br>
                작성날짜 : ${withBoard.writeDate }<br>
			<div id="content">
				<div id="writeContent">${withBoard.boardContent }</div>
			</div>
		</div>

		<a href="/withboard/withModifyView?boardNo=${withBoard.boardNo }">수정하기</a>
		<a href="">삭제하기</a> <a href="">목록으로</a>
		<hr>
		<h2>댓글.....ㅎ</h2>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

</html>