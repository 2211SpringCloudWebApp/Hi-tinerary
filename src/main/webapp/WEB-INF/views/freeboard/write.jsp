<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 작성</title>
		<style>
            #freeboardDiv{
                width: 1200px;
            }
        </style>
	</head>
	<div id="freeboardDiv">
		<body>
			<h2>| 자유게시판 새글쓰기</h2>
		    <hr>
			<form action="/freeboard/write" method="POST" enctype="multipart/form-data">
			   	<select name="boardHead" id="boardHead" onchange="changeselect();" >
			   		<option value="free" selected>잡담</option>
			  		<option value="question">질문</option>
			   	</select>
			    
			    <input name="boardTitle" type="text" > 
			    <span name="nickname">닉네임</span>
			    <hr>
		        <textarea name="boardSubject" style="width: 1000px; height: 400px;"></textarea> <br>
				<hr>
		        <span>본문이미지첨부</span>
		        <input name="uploadFile" type="file" >
		         
		        <br>
		            
				<input type="submit" value="글올리기">
				<input type="button" value="목록보기" onclick="location.href='/freeboard/list'">
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
	</div>
</html>