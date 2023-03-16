<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수정페이지</title>
	</head>
		<style>
			#container-update{
				margin : 0px auto;
				width : 1200px
			}
		</style>
	<body>
		<div id="container-update">
			<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
			<main>
				<h1>${groupName } 그룹 글수정하기</h1>
				<div>
					<form action="/group/board/update" method="post">
						<input type="hidden" name="BoardNo" value="${board.boardNo }">
						<input type="hidden" name="groupIndex" value="${groupIndex }">
						<input type="text" name="boardTitle" value="${board.boardTitle }">
						<textarea name="boardSubject" rows="40" cols="150">${board.boardSubject }</textarea>
						<input type="submit" value="수정하기">
						<a href="/group/groupinfopage?groupIndex=${groupIndex}">취소</a>
					</form>
				</div>
			</main>
			<footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	</body>
</html>