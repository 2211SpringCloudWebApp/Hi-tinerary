<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>기업회원 마이페이지</title>
	<link rel="stylesheet" href="../../../../resources/css/postList.css">
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
		            <a href="/company/mypage/selllist" class="nav-btn">판매내역 조회</a>
		            <a href="/company/mypage/write/post" class="nav-btn nownav">작성 글 조회</a>
		            <a href="/company/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		        </div>
		        <div id="mypage-contentbox">
		            <div id="mypage-title">
		                <h2>작성 글 조회</h2>
		            </div>
		            <div id="mypage-content">
		                <div class="selectboard">
		                    <a href="" class="selectboard-btn">투어상품</a>
		                </div>
		                <div class="boardlist-box">
		                    <div class="boardlist">
		                        <div class="tourboard-box">
		                            <table class="tourboard">
		                                <thead>
		                                    <tr>
		                                        <th width="100">번호</th>
		                                        <th width="500">상품명</th>
		                                        <th width="200">작성일자</th>
		                                        <th width="100">비고</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach items="${tList }" var="tour" varStatus="i">
			                                    <tr>
			                                    	<td>${i.count }</td>
			                                        <td>${tour.tourTitle }</td>
			                                        <td><fmt:formatDate value="${tour.writeDate }" pattern="yyyy-MM-dd ahh:mm"/></td>
			                                        <td><a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }" class="detail-btn">원문보기</a></td>
			                                    </tr>
		                                	</c:forEach>
		                                </tbody>
		                                <tfoot>
		                                    <tr>
		                                        <td colspan="4">
		                                        	<c:if test="${pi.currentPage > 1 }">
		                                            <a href="/company/mypage/write/post?&page=1" class="pagenav">&#60;&#60;&nbsp;</a>
		                                            <a href="/company/mypage/write/post?&page=${pi.currentPage - 1 }" class="pagenav">&#60;&nbsp;</a>
		                                            </c:if>
													<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
														<a href="/company/mypage/write/post?&page=${p }">${p }&nbsp;</a>
													</c:forEach>
													<c:if test="${pi.currentPage < pi.endNavi }">
		                                            <a href="/company/mypage/write/post?&page=${pi.currentPage + 1 }" class="pagenav">&#62;&nbsp;</a>
		                                            <a href="/company/mypage/write/post?&page=${pi.endNavi }" class="pagenav">&#62;&#62;&nbsp;</a>
		                                            </c:if>                         
		                                        </td>
		                                    </tr>
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