<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>기업회원 마이페이지</title>
	<link rel="stylesheet" href="../../../../resources/css/sellList.css">
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<main>
		   <div class="container">
		        <div class="side-nav">
		            <h3>${loginUser.userNickname} 님</h3>
		            <a href="/user/mypageCompany" class="nav-btn">내 정보 조회</a>
		            <a href="/company/mypage/selllist" class="nav-btn nownav">판매내역 조회</a>
		            <a href="/company/mypage/write/post" class="nav-btn">작성 글 조회</a>
		            <a href="/company/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		        </div>
		        <div id="mypage-contentbox">
		            <div id="mypage-title">
		                <h2>판매내역 조회</h2>
		            </div>
		            <div id="mypage-content">
		                <div class="selectboard">
		                    <a href="" class="selectboard-btn">투어상품</a>
		                </div>
		                <div class="boardlist-box">
		                    <div class="boardlist">
		                        <div class="tourboard-box">
								<!-- <input type="hidden" name="userNo" value="${loginUser.userNo }"> -->
		                            <table class="tourboard">
		                                <thead>
		                                    <tr>
		                                        <th width="150">판매일자</th>
		                                        <th width="300">상품명</th>
		                                        <th width="100">구매자명</th>
		                                        <th width="200">전화번호</th>
		                                        <th width="150">가격</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach items="${tsList }" var="ts">
			                                    <tr>
			                                    	<td><fmt:formatDate value="${ts.payDate }" pattern="yyyy-MM-dd"/></td>
			                                        <td>${ts.tourTitle }</td>
			                                        <td>${ts.userName }</td>
			                                        <td>${ts.userPhone }</td>
			                                        <td><fmt:formatNumber value="${ts.price }" pattern="#,###,###"/></td>
			                                    </tr>
		                                	</c:forEach>
		                                </tbody>
	 	                                <tfoot>
		                                </tfoot>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div> 
		    </div>
		</main>
	</body>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>
</html>