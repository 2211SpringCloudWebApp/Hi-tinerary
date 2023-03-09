<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>커뮤니티_동행찾기 글쓰기</title>
	<link rel="stylesheet" href="../../../resources/css/withBoardWrite.css">
	</head>

<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	<main id="withBoardList">
		<div id="withTitle">
			<div id="bar"></div>
			<p>커뮤니티</p>
			<button>새글쓰기</button>
		</div>
		
		<form action="/withboard/withBoardWrite" method="post" enctype="multipart/form-data">
			<div>
				<label>모집인원</label> 
				<input type="range" min="1" max="10" value="1" class="slider" id="myRange" name="maxPeople"> 
				<span id="value"></span>명<br>
				<label>날짜 선택</label> 
				<input type="date" name="start-Date"> - <input type="date" name="end-Date"><br> 
				<input type="file" name="uploadFile"><br>
				<input type="text" placeholder="ex) 12월 3박 4일 강릉 바다 보러갈 동행 3명 구해요" name="boardTitle"><br>
				<textarea name="boardContent" id="" cols="30" rows="10"></textarea><br> 
				<input type="submit" value="글 올리기"> 
				<input type="reset" value="취소">
			</div>
		</form>

		<script>
				var slider = document.getElementById("myRange");
				var output = document.getElementById("value");
				output.innerHTML = slider.value;
	
				slider.oninput = function() {
					output.innerHTML = this.value;
				}
			</script>
	</main>
	<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
</body>
</html>