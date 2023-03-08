<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성</title>
	</head>
	<body>
		<h1>자유게시판 새글쓰기</h1>
		<form>
    		<select name="fruit">
      			<option value="free">잡담</option>
      			<option value="question">질문</option>
    		</select>
  		</form>
		<form action="/notice/write.kh" method="POST" enctype="multipart/form-data">
			제목 : <input type="text" name="noticeTitle"> <br>
			작성자 : <input type="text" name="noticeWriter"> <br>
			내용 : <textarea name="noticeContent"></textarea> <br>
			첨부파일 : <input type="file" name="uploadFile"> <br>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</form>
	</body>
</html>