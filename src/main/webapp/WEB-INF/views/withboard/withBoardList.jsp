<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 목록</title>
<style>
table{
	border: 1px solid black;
	margin: auto;
}
th, td{
	border: 1px solid black;
}
h1{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	<h1>동행찾기 게시판</h1>
	<div>
	<button onclick="location.href='/withboard/withWriteView'">글쓰기</button>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>닉네임</th>
					<th>썸네일</th>
					<th>시작날짜</th>
					<th>끝날짜</th>
					<th>현재인원</th>
					<th>최대인원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ wList}" var="withBoard" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${withBoard.boardTitle }</td>
						<td>${withBoard. userNo}</td>
						<td>
							<a href="/withboard/withBoardDetail?boardNo=${withBoard.boardNo }">
		                	<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
		                	
		                	</a>
						</td>
						<td>${withBoard.startDate }</td>
						<td>${withBoard.endDate }</td>
						<td>${withBoard.currentPeople }</td>
						<td>${withBoard.maxPeople }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>