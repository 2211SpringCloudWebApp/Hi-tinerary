<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
	</head>
		<style>
			#myPage-container{
				width : 1200px;
			}
		</style>
	<body>
		<div id="myPage-container">
			<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
			<main>
				<div id="myPage-nav">
					<h1>${loginUser.userNickname } 님</h1>
					<a href="">상품 구매내역 조회</a>
					<a href="">작성 글 조회</a>
					<a href="">작성 댓글 조회</a>
					<a href="/group/groupinfopage">그룹 페이지</a>
				</div>
				<div id="myPage-area">
					<div id="title">
						<span>상품 구매내역 조회</span>
					</div>
					
					<div id="content">
						<c:forEach items="${tList }" var="tour">
							<div class="content-img">
							</div>
							<div class="content-box">
								<div class="content-title">
									<p>${tour.tourTitle }</p>
								</div>
								<div class="content-content">
								</div>
							</div>
							<div class="content-btn">
							<a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">구매 상품 상세보기</a>
							<form action="/user/cancelbuy" method="post">
								<input type="hidden" name="userNo"value="${loginUser.userNo }">
								<input type="hidden" name="payDate"value="${tour.payDate }">
								<input type="hidden" name="tourNo" value="${tour.tourNo }">
								<input type="submit" value="삭제">
							</form>
							</div>
						</c:forEach>
					</div>
				</div>
			</main>
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	</body>
</html>