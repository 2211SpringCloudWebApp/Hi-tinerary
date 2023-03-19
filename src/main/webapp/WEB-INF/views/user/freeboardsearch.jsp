<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	            <a href="" class="nav-btn">내 정보 조회</a>
	            <a href="" class="nav-btn">상품 구매내역 조회</a>
	            <a href="" class="nav-btn nownav">작성 글 조회</a>
	            <a href="" class="nav-btn">작성 댓글 조회</a>
	            <a href="" class="nav-btn">그룹 페이지</a>
	        </div>
	        <div class="mypage-contentbox">
	            <div class="mypage-title">
	                <p>작성 글 조회</p>
	            </div>
	            <div class="mypage-content">
	                <div class="selectboard">
	                    <a href="" class="selectboard-btn">동행구하기</a>
	                    <a href="" class="selectboard-btn selectedboard-btn">자유게시판</a>
	                </div>
	                <div class="boardlist-box">
	                    <div class="boardlist">
	                        <div class="freeboard-box">
	                            <table class="freeboard">
	                                <thead>
	                                    <tr>
	                                        <th width="70">번호</th>
	                                        <th width="90">말머리</th>
	                                        <th width="360">제목</th>
	                                        <th width="180">쓴날짜</th>
	                                        <th width="100">비고</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${fList }" var="freeboard" varStatus="i">
		                                    <tr>
		                                        <td>${i.count }</td>
		                                        <c:if test="${freeboard.boardHead == 'question'}">
			                                        <td>질문</td>
		                                        </c:if>
		                                        <c:if test="${freeboard.boardHead == 'free'}">
			                                        <td>잡담</td>
		                                        </c:if>
			                                    <td><a href="/freeboard/detail?boardNo=${freeboard.boardNo }">${freeboard.boardTitle }</a></td>
			                                    <td><fmt:formatDate value="${freeboard.writeDate }" pattern="yyyy-MM-dd ahh:mm" /></td>
		                                        <td>
			                                        <c:if test="${freeboard.boardCheck == 1 }"><p class="complete">답변완료</p></c:if>
			                                        <c:if test="${freeboard.boardHead == 'question' && freeboard.boardCheck == 0 }"><p class="wait">답변대기</p></c:if>
		                                        </td>
		                                    </tr>
	                                	</c:forEach>
	                                </tbody>
	                                <tfoot>
	                                    <tr>
	                                        <td colspan="5">
	                                            <a href="/user/mypage/write/freeboard?page=1" class="pagenav">&#60;&#60;&nbsp;</a>
	                                            <a href="/user/mypage/write/freeboard?page=${pi.currentPage - 1 }" class="pagenav">&#60;&nbsp;</a>
												<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
													<a href="/user/mypage/write/freeboard?page=${p }">${p }&nbsp;</a>
												</c:forEach>
	                                            <a href="/user/mypage/write/freeboard?page=${pi.currentPage + 1 }" class="pagenav">&#62;&nbsp;</a>
	                                            <a href="/user/mypage/write/freeboard?page=${pi.endNavi }" class="pagenav">&#62;&#62;&nbsp;</a>
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
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	</footer>
</body>
</html>