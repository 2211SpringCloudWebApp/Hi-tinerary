<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 목록</title>
<link rel="stylesheet" href="../../../resources/css/withBoardList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	 <main id="withBoardList">
        <div id="withTitle">
            <div id="bar_title"></div>
            <p>커뮤니티</p>
        </div>
        <div id="withSubTitle">
            <div id="bar_subtitle"></div>
            <p>동행찾기</p>
            <button onclick="location.href='/withboard/withWriteView'">글쓰기</button>
        </div>

	
	<div class="list_wrapper">
		<ul>
			<c:forEach items="${wList }" var="withBoard">
				<li>
					<div class="img">
						<a href="/withboard/withBoardDetail?boardNo=${withBoard.boardNo }">
						<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
						</a>
					</div> 
					<strong class="tit">${withBoard.boardTitle }</strong> 
					<span class="date"> <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~ 
					<fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" /></span> 
					<span class="writer">${withBoard. userNo}</span> 
					<span class="people">${withBoard.currentPeople } / ${withBoard.maxPeople }</span>
				</li>
			</c:forEach>
		</ul>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>