<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성</title>
	</head>
	<body>
		<h2>| 자유게시판 새글쓰기</h2>
        <hr>
		<form>
    		<select name="boardHead" id="boardHead" onchange="changeselect();" >
      			<option value="free" selected>잡담</option>
      			<option value="question">질문</option>
    		</select>
    
            <input name="boardTitle" type="text" > 
            <span name="nickname">닉네임</span>
            <span id="testspan" style="display: none;">!!!질문글!!!</span>
  		</form>
        <hr>
		<form action="/freeboard/write" method="POST" enctype="multipart/form-data">
            <textarea name="boardSubject" style="width: 1000px; height: 400px;"></textarea> <br>
			<hr>
            <span>본문이미지첨부</span>
            <input name="uploadFile" type="file" >
            
            <br>
			<input type="submit" value="글올리기">
			<input type="reset" value="목록보기">
		</form>
		
        <script>
			function changeselect() {
				var selectBox = document.getElementById("boardHead");
              	var testspan = document.getElementById("testspan");
              	console.log(selectBox);
              	if (selectBox.value == "free") {
                	testspan.style.display = "none";
              	} else {
                	testspan.style.display = "block";
              	}
            }
        </script>
	</body>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>
</html>