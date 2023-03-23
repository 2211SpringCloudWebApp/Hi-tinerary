<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../../resources/css/usermypagewriteboardlist.css">
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	</header>
	<main>
	    <div class="mypage-container">
	        <div class="mypage-navbox">
	            <p class="nav-content">${loginUser.userNickname } 님</p>
			    <a href="/user/mypage" class="nav-btn">내 정보 조회</a>
		        <a href="/user/mypage/buylist" class="nav-btn">상품 구매내역 조회</a>
		        <a href="/user/mypage/write/withboard" class="nav-btn nownav">작성 글 조회</a>
		        <a href="/user/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		        <a href="/group/groupinfopage" class="nav-btn">그룹 페이지</a>
	        </div>
	        <div class="mypage-contentbox">
	            <div class="mypage-title">
	                <p>작성 글 조회</p>
	            </div>
	            <div class="mypage-content">
	                <div class="selectboard">
	                    <a href="/user/mypage/write/withboard" class="selectboard-btn selectedboard-btn">동행구하기</a>
	                    <a href="/user/mypage/write/freeboard" class="selectboard-btn">자유게시판</a>
	                </div>
	                <div class="boardlist-box">
	                    <div class="boardlist">
	                        <div class="withboard-box">
	                        	<c:forEach items="${wList }" var="withBoard">
	                        		<a href="/withboard/withBoardDetail?boardNo=${withBoard.boardNo }">
	                        			<div class="withboard">
			                                <div class="thumbnail">
			                                    <img src="../../../${withBoard.boardImage }" alt="">
			                                </div>
			                                <div class="withboard-info">
			                                    <p class="withboard-title">${withBoard.boardTitle }</p>
			                                    <p class="withboard-day">시작날짜 : <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd"/> <br> 끝날짜 : <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd"/></p>
			                                    <p class="withboard-NOP">${withBoard.currentPeople } / ${withBoard.maxPeople }</p>
	                                		</div>
	                            		</div>
	                        		</a>
	                        	</c:forEach>
	                        </div>
	                       <div class="with-nav">
	                    		<c:if test="${pi.currentPage > 1 }">
		                    		<a href="/user/mypage/write/withboard?page=1" class="pagenav">&#60;&#60;&nbsp;</a>
		                   			<a href="/user/mypage/write/withboard?page=${pi.currentPage - 1 }" class="pagenav">&#60;&nbsp;</a>
			                    </c:if>
			                	<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
			                    	<a href="/user/mypage/write/withboard?page=${p }">${p }&nbsp;</a>
			                	</c:forEach>
			                	<c:if test="${pi.currentPage < pi.endNavi }">
				                    <a href="/user/mypage/write/withboard?page=${pi.currentPage + 1 }" class="pagenav">&#62;&nbsp;</a>
				                    <a href="/user/mypage/write/withboard?page=${pi.endNavi }" class="pagenav">&#62;&#62;&nbsp;</a>
			                	</c:if>
	               	 		</div>
	                   </div>
	                </div>
	            </div>
	        </div> 
	    </div>
	</main>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	</footer>
</body>
</html>