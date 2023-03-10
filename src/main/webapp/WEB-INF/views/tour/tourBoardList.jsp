<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품게시판</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourBoardList.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			 <main id="tourBoardList">
	                <div id="boardTitle">
	                    <div id="bar">  </div>
	                    <p>투어 / 패키지 상품</p>
	                    <a href="/tour/tourBoardWrite"><button>새글쓰기</button></a>
	                </div>
	                
	                <div id="tourList">
		                <c:forEach items="${tList}" var="tour">
		                	<a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">
		                	<img src="${tour.thumbnail != null ? tour.thumbnail.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noThumbnail.png'}">
		                	</a>
		                </c:forEach>
	                </div>
	               
	                
	            </main>
	     	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	     	    

	</body>
</html>