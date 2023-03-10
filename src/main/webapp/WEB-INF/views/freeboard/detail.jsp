<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 상세조회</title>
		<style>
			#freeboardDiv{
                width: 1200px;
                margin-bottom: 50px; 
                margin-top: 50px; 
            }
		</style>
	</head>
	<body>
		<h1>자유게시판 상세</h1>
		<b>번호</b> 　　: ${freeboard.boardNo } / 제목 : ${freeboard.boardTitle } / 작성자 : (추가예정) / 작성날짜 : ${freeboard.updateDate }
		<br>
		<b>내용</b> 　　: ${freeboard.boardSubject }
		<br>
		<b>첨부파일</b> : ${freeboard.boardImage }
		<br>
		<b>파일경로</b> : ${freeboard.boardImage }
		<br>
		<c:url var="nModify" value="/freeboard/modifyView">
			<c:param name="boardNo" value="${freeboard.boardNo }"/>
		</c:url>
		<a href="${fModify }">수정 페이지로 이동</a>
		<a href="/freeboard/remove?boardNo=${freeboard.boardNo }" onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
		<a href="/freeboard/list">목록으로 이동</a>
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>