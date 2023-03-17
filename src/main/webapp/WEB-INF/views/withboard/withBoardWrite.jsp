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
		
		<form action="/withboard/withBoardWrite" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<input type="hidden" value="${loginUser.userNo }" name="loginUserNo">
		<input type="hidden" value="${loginUser.userNickname}" name="userNickname">
		<input type="hidden" value="${loginUser.userGender}" name="userGender">
		<input type="hidden" value="${loginUser.userBirthDate }" name="usesrBirthDate"> 
            <div class="">
            <input name="userNo" type="text" value="${loginUser.userNo }" style="display:none">
                <label>모집인원</label> 
				<input type="range" min="1" max="10" value="1" class="slider" id="myRange" name="maxPeople"> 
				<span id="value"></span>명<br>
				<label>날짜 선택</label> 
				<input type="date" name="start-Date" onchange="startDecide()" min="${now }" required> - 
				<input type="date" name="end-Date" onchange="endDecide()" min="${now }" required><br>
				<div id="Container" contentEditable="true"></div>
				<div class="oneHundred">
				  <div class="infos">본문이미지첨부</div>
				  <div class="filebox">
				    <label for="withImage">파일찾기</label> 
				    <input class="upload-name" id="upload-img" placeholder="jpg, png 파일만 선택해 주세요">
				    <input type="file" name="uploadFile" id="withImage">
				  </div>
				</div>
				
				<!-- <input type="text" placeholder="작성자"><br> -->
				<input type="text" placeholder="ex) 12월 3박 4일 강릉 바다 보러갈 동행 3명 구해요" name="boardTitle" required><br>
				<textarea name="boardContent" id="" cols="30" rows="10" required></textarea><br> 
                
                <div class="writeButton">
                    <button type="submit" id="submit">글 올리기</button>
                    <button id="list">목록보기</button>
                </div>
            </div>
        </form>
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
            let imgElement = null;

            fileInput.addEventListener("change", function() {
              const file = this.files[0];

              // 파일이 이미지 파일인 경우
              if (file.type.match("image.*")) {
                const reader = new FileReader();

                reader.addEventListener("load", function() {
                  // 이미지 파일을 삽입
                  const img = document.createElement("img");
                  img.src = reader.result;
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