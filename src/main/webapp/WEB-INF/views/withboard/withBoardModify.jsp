<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 수정페이지</title>
<link rel="stylesheet" href="../../../resources/css/withBoardModify.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	 <main id="withBoardModify">
        <div id="withTitle">
            <div id="bar_title"></div>
            <p>커뮤니티</p>
        </div>
		<div id="withSubTitle">
			<div id="bar_subtitle"></div>
			<p>동행찾기 수정하기</p>
			<c:if test="${loginUser eq null }">
				<button onclick="noWrite()">글쓰기</button>
			</c:if>
			<c:if test="${loginUser ne null }">
				<button onclick="location.href='/withboard/withWriteView'">글쓰기</button>
			</c:if>
		</div>
		<div class="modifyFrame">
	<form action="/withboard/withBoardModify" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${withBoard.boardNo }" name="boardNo">
		<input type="hidden" value="${withBoard.boardImage }" name="boardImage">
		
		<div class="withTitle">
			<input type="text" name="boardTitle" value="${withBoard.boardTitle }">
		</div>
		
		<div class="mainImage">
		<div id="Container" contentEditable="true">
			<img src="../../../${withBoard.boardImage }">
		</div>
		<div class="oneHundred">
			<div class="filebox">
				<!-- <input class="upload-name" id="upload-img" placeholder="jpg, png 파일만 선택해 주세요">  -->
				<input type="file" name ="reloadFile" id="withImage">
			</div>
		</div>
		</div>
    
    <div class="date">
    <p>날짜 선택</p>
    <div>
	<input type="date" name="start-Date" value="<fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" />" onchange="startDecide()" min="${now }" required>
	<span class="divider"> ~ &nbsp;</span>
	<input type="date" name="end-Date" value="<fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" />" onchange="endDecide()" min="${now }" required><br>
	</div>
	</div>
	
	<div class="maxPeople">
	<label>모집인원</label>
	<input type="range" min="1" max="15" value="${withBoard.maxPeople}" class="slider" id="myRange" name="maxPeople">
	<strong>${withBoard.currentPeople}</strong> / <span id="value">value="${withBoard.maxPeople}"</span>
	</div>
	
	<div class="withContent">
	<textarea rows="25" cols="136" name="boardContent" id="withContent" required>${withBoard.boardContent }</textarea>
	</div>
	<div class="modifyButton">
	<button type="submit" id="submit">수정하기</button>
	<button onclick="location.href='/withboard/withBoardList';">목록으로</button>
	</div>
	</form>
	</div>
	</main>
	
	
	<script>
		/* range bar */
		 var slider = document.getElementById("myRange");
         var output = document.getElementById("value");
         output.innerHTML = slider.value;

         slider.oninput = function () {
             output.innerHTML = this.value;
         }
         
         /* 이미지 첨부하는 부분 */
       
		const container = document.getElementById("Container");
		const fileInput = document.getElementById("withImage");
		let imgElement = container.getElementsByTagName("img")[0];

		fileInput.addEventListener("change", function() {
			const file = this.files[0];

			// 파일이 이미지 파일인 경우
			if (file.type.match("image.*")) {
				const reader = new FileReader();

				reader.addEventListener("load", function() {
					// 이미지 파일을 삽입
					const img = document.createElement("img");
					img.src = reader.result;
					// 이미지 요소에 스타일을 적용하여 크기 조절
	                img.style.width = "950px";
	                img.style.height = "492px";
					if (imgElement) {
						// 기존에 삽입된 이미지가 있다면 삭제
						container.removeChild(imgElement);
					}
					imgElement = img;
					container.appendChild(imgElement);
				});

				// 파일 내용 읽기
				reader.readAsDataURL(file);
			}
		});

		//유효성 체크 부분
        function startDecide(){
        	var startDate = document.querySelector("[name=start-Date]");
        	var endDate = document.querySelector("[name=end-Date]");
        	if(startDate.value > endDate.value){
        		endDate.value = startDate.value;
        	}
        }
        
        function endDecide(){
			var startDate = document.querySelector("[name=start-Date]")
			var endDate = document.querySelector("[name=end-Date]")
			if(startDate.value > endDate.value){
				alert("종료날짜가 시작날짜보다 이릅니다.")
				endDate.value = startDate.value;
			}
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>