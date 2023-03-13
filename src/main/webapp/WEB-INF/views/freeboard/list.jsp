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
		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<!-- 메인 -->
		<main>
			<div id="free-container">
				<div id="freeboard_Nav">
            		<div id="freeboard_td1">
		                <ul>
		                	<li>|자유게시판</li>
		                    <li><a href="/freeboard/list" >전체보기</a></li>|
		    				<li><a href="/freeboard/list?searchCondition=question" >질문</a></li>|
		    				<li><a href="/freeboard/list?searchCondition=free" >잡담</a></li>
		                </ul>
        	   		</div>
            		<div id="freeboard_td2"></div>
            		<c:if test="${loginUser.userNo != null }">
	            		<div id="write-btn">
	                		<input type="button" id="button1" value="새글쓰기" onclick="location.href='/freeboard/write'">
	            		</div>
            		</c:if>
            		<c:if test="${loginUser.userNo == null }">
            			<div id="write-btn">
	                		<input type="button" id="button1" value="새글쓰기" onclick="alert('로그인이 필요합니다.')">
	            		</div>
            		</c:if>
        		</div>
        		<div id="freeboard_div2">
	            	<table style="width: 1200px; margin-right: 50px;">
	            		<!-- 게시물 리스트 출력 -->
						<tbody>
							<c:forEach items="${fList }" var="freeboard" varStatus="i">
								<table id="listTable" >
									<tr>
										<td style="width: 5%; text-align: center;">
											<c:if test="${pi.currentPage != 1}">
												${pi.currentPage * 10 + i.count}
											</c:if>
											<c:if test="${pi.currentPage == 1}">
												${i.count}
											</c:if>
										</td>
										<td style="width: 5%; text-align: center;">
											<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
											<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
										</td>
										<td style="width: 60%;">
											<a href="/freeboard/detail?boardNo=${freeboard.boardNo }">${freeboard.boardTitle }</a>
										</td>
										<td style="width: 20%;">
											작성자
										</td>
										<td style="width: 10%; text-align: center;">
											<c:if test="${freeboard.boardHead == 'question'}">
												<c:if test="${freeboard.boardCheck == 0}">답변대기</c:if>
												<c:if test="${freeboard.boardCheck == 1}">답변완료</c:if>					
											</c:if>
										</td>
									</tr>
								</table>
							</c:forEach>
						</tbody>
						<!-- 페이징처리 -->
						<tfoot style="height: 100px;">
							<tr align="center">
								<td colspan="5" style="text-align: center;">
									<c:if test="${pi.currentPage != 1}">
										<c:url var="Url1" value="/freeboard/list">
											<c:param name="page" value="1"></c:param>
											<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
										</c:url>
										<a href="${Url1 }">[<<]</a>
									</c:if>
									<c:if test="${pi.currentPage != 1}">
										<c:url var="Url1" value="/freeboard/list">
											<c:param name="page" value="${pi.currentPage-1}"></c:param>
											<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
										</c:url>
										<a href="${Url1 }">[<]</a>
									</c:if>
									<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
										<c:url var="pageUrl" value="/freeboard/list">
											<c:param name="page" value="${p }"></c:param>
											<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
										</c:url>
										<a href="${pageUrl }">${p }</a>&nbsp;
									</c:forEach>
									<c:if test="${pi.currentPage < pi.maxPage}">
										<c:url var="Url2" value="/freeboard/list">
											<c:param name="page" value="${pi.currentPage+1}"></c:param>
											<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
										</c:url>
										<a href="${Url2 }">[>]</a>
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage}">
										<c:url var="Url1" value="/freeboard/list">
											<c:param name="page" value="${pi.maxPage }"></c:param>
											<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
										</c:url>
										<a href="${Url1 }">[>>]</a>
									</c:if>
								</td>
							</tr>
						</tfoot>
					</table>
	        	</div>
			</div>
		</main>
		<!-- 푸터 -->
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>