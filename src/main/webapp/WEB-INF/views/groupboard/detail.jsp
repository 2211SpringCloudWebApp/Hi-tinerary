<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시글 상세</title>
		<style>
			.comment-area{
				margin-left : 20px;
				width : 150px;
				height : 25px;
			}
			.reply-area{
				margin-left : 50px;
				width : 150px;
				height : 25px;
			}
		</style>
	</head>
	<body>
		<h1>${gBoard.groupName } 그룹 게시판</h1>
		<div>
			<form action="/group/board/write" method="post">
				<input type="text" name="groupTitle" value="${gBoard.boardTitle }" readonly> <br>
				<textarea name="groupSubject" rows="40" cols="150" readonly>${gBoard.boardSubject }</textarea>
			</form>
		</div>
		<div>
			${write }
		</div>
	</body>
</html>