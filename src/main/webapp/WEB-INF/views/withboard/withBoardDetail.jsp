<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행찾기 게시판 상세페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
<h1>커뮤니티/동행찾기</h1>
<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}"><br>
제목 : ${withBoard.boardTitle }<br>
<%-- <fmt:formatDate value="${withBoard.startDate }" pattern="yy.MM.dd h시"/> ~ <fmt:formatDate value="${withBoard.endDate }" pattern="yy.MM.dd h시"/> --%>
${withBoard.startDate } ~ ${withBoard.endDate }<br>
${withBoard.currentPeople } / ${withBoard.maxPeople }
작성자 : ${withBoard.userNo }
작성날짜 : ${withBoard.writeDate }
내용 : ${withBoard.boardContent }
<hr>
<h2>댓글.....ㅎ</h2>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>