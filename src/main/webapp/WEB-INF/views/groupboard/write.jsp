<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시판 글쓰기</title>
	</head>
		<style>
			#container-write{
				width : 1200px;
				margin : 0px auto;
			}
		</style>
	<body>
		<div id="container-write">
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<h1>${groupName } 그룹 글쓰기</h1>
			<div>
				<form action="/group/board/write" method="post">
					<input type="hidden" name="groupNo" value="${groupNo }">
					<input type="hidden" name="groupIndex" value="${groupIndex }">
					<input type="text" name="groupTitle">
					<textarea name="groupSubject" rows="40" cols="150"></textarea>
					<input type="submit" value="글쓰기">
					<a href="/group/groupinfopage?groupIndex=${groupIndex}">취소</a>
				</form>
			</div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</body>
</html>