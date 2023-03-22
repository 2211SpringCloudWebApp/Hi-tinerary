<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시판 글쓰기</title>
	</head>
		<link rel="stylesheet" href="../../../../resources/css/groupboardwrite.css">
	<body>
		<div id="container-write">
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<h1>${groupName } 그룹 글쓰기</h1>
			<div>
				<form action="/group/board/write" method="post" class="write-box">
					<input type="hidden" name="groupNo" value="${groupNo }">
					<input type="hidden" name="groupIndex" value="${groupIndex }">
					<label class="title-area">
					<p class="title-plain">제목 : </p><input type="text" name="groupTitle" class="board-title" required>
					</label>
					<textarea name="groupSubject" rows="40" cols="150" required></textarea>
					<div class="btn-box">
						<input type="submit" value="글쓰기" class="write-btn">
						<a class="cancel-btn" href="/group/groupinfopage?groupIndex=${groupIndex}">취소</a>
					</div>
				</form>
			</div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	</body>
</html>