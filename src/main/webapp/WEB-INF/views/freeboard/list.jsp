<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
		<link rel="stylesheet" href="../../../resources/css/freeboardList.css">
	</head>
	<body>
		<div id="free-container">
			<!-- 헤더 -->
			<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
			<!-- 메인 -->
			<main>
				<jsp:include page="/WEB-INF/views/freeboard/freeboardNav.jsp"></jsp:include>
        		<div id="free-container">
					<c:forEach items="${fList }" var="freeboard" varStatus="i">
						<!-- 게시물 리스트 출력 -->
						<table <c:if test="${i.count == 10}">style="border-bottom: solid 1px #FBD188;"</c:if> id="listTable" >
							<tr>
								<td>
									<c:if test="${pi.currentPage != 1}">
										${pi.currentPage * 10 + i.count}
									</c:if>
									<c:if test="${pi.currentPage == 1}">
										${i.count}
									</c:if>
								</td>
								<td>
									<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
									<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
								</td>
								<td>
									<a href="/freeboard/detail?boardNo=${freeboard.boardNo }">${freeboard.boardTitle }</a>
								</td>
								<td>
									${loginUser.userNickname }
								</td>
								<td>
									<c:if test="${freeboard.boardHead == 'question'}">
										<c:if test="${freeboard.boardCheck == 0}"><span id ="freespan1">답변대기</span></c:if>
										<c:if test="${freeboard.boardCheck == 1}"><span id ="freespan2">답변완료</span></c:if>					
									</c:if>
								</td>
							</tr>
						</table>
					</c:forEach>

					<!-- 페이징처리 -->
					<table id="listfooter">
						<tr align="center">
							<td colspan="5">
								<c:if test="${pi.currentPage != 1}">
									<c:url var="Url1" value="/freeboard/list">
										<c:param name="page" value="1"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${Url1 }"> << </a>
								</c:if>
								<c:if test="${pi.currentPage != 1}">
									<c:url var="Url1" value="/freeboard/list">
										<c:param name="page" value="${pi.currentPage-1}"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${Url1 }"> < </a>
								</c:if>
								
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/freeboard/list">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<c:choose>
										<c:when test="${p == pi.currentPage}">
									    	<a href="${pageUrl }" class="selected">${p }</a>&nbsp;
									    </c:when>
									    <c:otherwise>
									    	<a href="${pageUrl }">${p }</a>&nbsp;
									    </c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${pi.currentPage < pi.maxPage}">
									<c:url var="Url2" value="/freeboard/list">
										<c:param name="page" value="${pi.currentPage+1}"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${Url2 }"> > </a>
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage}">
									<c:url var="Url1" value="/freeboard/list">
										<c:param name="page" value="${pi.maxPage }"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${Url1 }"> >> </a>
								</c:if>
							</td>
						</tr>
					</table>
	        	</div>
			</main>
			<!-- 푸터 -->
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	</body>
</html>