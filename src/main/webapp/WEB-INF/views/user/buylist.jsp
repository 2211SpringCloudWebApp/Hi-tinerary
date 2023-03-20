<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="../../../../resources/css/usermypagebuylist.css">
	</head>
	<body>
	  <header>
	  	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	  </header>
	  <main>
		<div class="mypage-container">
	        <div class="mypage-navbox">
	            <p class="nav-content">${loginUser.userNickname} 님</p>
		        <a href="/user/mypage" class="nav-btn">내 정보 조회</a>
		        <a href="/user/mypage/buylist" class="nav-btn nownav">상품 구매내역 조회</a>
		        <a href="/user/mypage/write/withboard" class="nav-btn">작성 글 조회</a>
		        <a href="/user/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		        <a href="/group/groupinfopage" class="nav-btn">그룹 페이지</a>
	        </div>
	        <div class="mypage-contentbox">
	            <div class="mypage-title">
	                <p>상품 구매내역 조회</p>
	            </div>
	            <div class="likeblock"></div>
	            <div class="mypage-content">
	                <c:forEach items="${tList}" var="tour">
		                <div class="package-box">
		                    <div class="thumbnail">
		                        <img src="${tour.thumbnail }" alt="123">
		                    </div>
		                    <div class="package-content">
		                        <div class="corporation">
		                            <p>${tour.userNickname }</p>
		                        </div>
		                        <div class="package-info">
		                            <p>${tour.tourTitle }</p>
		                            <p><fmt:formatNumber value="${tour.price }" pattern="###,###,###,###원" /></p>
		                            <p><fmt:formatDate value="${tour.startDate }" pattern="yyyy-MM-dd ahh:mm" /> ~ <fmt:formatDate value="${tour.endDate }" pattern="yyyy-MM-dd ahh:mm" /></p>
		                        </div>
		                    </div>
		                    <div class="package-btn-box">
		                        <a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }" class="detail-btn">구매 상품 상세보기</a>
		                        <form action="/user/cancelbuy" method="post">
		                            <input type="hidden" name="userNo" value="${loginUser.userNo }">
		                            <input type="hidden" name="tourNo" value="${tour.tourNo }">
		                            <input type="hidden" name="payDate" value="${tour.payDate }">
		                            <input type="submit" class="cancel-btn" value="구매취소">
		                        </form>
		                    </div>
		                </div>
	                </c:forEach>
	                <div class="package-nav">
	                    <c:if test="${pi.currentPage > 1 }">
		                    <a href="/user/mypage/buylist?page=1" class="pagenav">&#60;&#60;&nbsp;</a>
		                    <a href="/user/mypage/buylist?page=${pi.currentPage - 1 }" class="pagenav">&#60;&nbsp;</a>
	                    </c:if>
	                	<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
	                    	<a href="/user/mypage/buylist?page=${p }">${p }&nbsp;</a>
	                	</c:forEach>
	                	<c:if test="${pi.currentPage < pi.endNavi }">
		                    <a href="/user/mypage/buylist?page=${pi.currentPage + 1 }" class="pagenav">&#62;&nbsp;</a>
		                    <a href="/user/mypage/buylist?page=${pi.endNavi }" class="pagenav">&#62;&#62;&nbsp;</a>
	                	</c:if>
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