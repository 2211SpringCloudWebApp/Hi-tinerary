<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<main style="height: 600px">
			<!-- 투어/패키지 상품 -->
			<div id="tourBoardList"></div>
			<!-- 커뮤니티(동행찾기) -->
			<div id="withBoardList"></div>
			<!-- 커뮤니티(자유게시판) -->
			<div id="freeBoardList"></div>
		</main>	
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>