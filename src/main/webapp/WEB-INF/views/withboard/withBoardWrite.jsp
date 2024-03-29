<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>커뮤니티_동행찾기 글쓰기</title>
	<link rel="stylesheet" href="../../../resources/css/withBoardWrite.css">
	</head>

<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	 <main id="withBoardWrite">
        <div id="withTitle">
            <div id="bar_title"></div>
            <p>커뮤니티</p>
        </div>
		<div id="withSubTitle">
			<div id="bar_subtitle"></div>
			<p>동행찾기 글쓰기</p>
		</div>
		<div class="writeFrame">
		<form action="/withboard/withBoardWrite" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<input type="hidden" value="${loginUser.userNo }" name="loginUserNo">
		<input type="hidden" value="${loginUser.userNickname}" name="userNickname">
		<input type="hidden" value="${loginUser.userGender}" name="userGender">
		<input type="hidden" value="${loginUser.userBirthDate }" name="usesrBirthDate"> 
        <input name="userNo" type="text" value="${loginUser.userNo }" style="display:none">
        
		<div class="withTitle">
			<input type="text" placeholder="ex) 12월 3박 4일 강릉 바다 보러갈 동행 3명 구해요" name="boardTitle" required>
		</div>
		
		<div class="mainImage">
			<div id="Container" contentEditable="true">
			</div>
			<div class="oneHundred">
				<div class="filebox">
					<!-- <label for="withImage">파일찾기</label>  -->
					<!-- <input class="upload-name" id="upload-img" placeholder="jpg, png 파일만 선택해 주세요"> -->
					<input type="file" name="uploadFile" id="withImage">
				</div>
			</div>
		</div>
		
		<div class="date">
		  <p>날짜 선택</p> 
		  <div class="dateInputs">
		    <input type="date" name="start-Date" onchange="startDecide()" min="${now }" required>
		    <span class="divider"> ~ &nbsp;</span>
		    <input type="date" name="end-Date" onchange="endDecide()" min="${now }" required>
		  </div>
		</div>
		
		<div class="maxPeople">
			<label>모집인원</label>
			<input type="range" min="1" max="15" value="1" class="slider" id="myRange" name="maxPeople"> 
			<span id="value"></span>
		</div>
		
		<div class="withConetnt">
			<textarea name="boardContent" id="withContent" cols="136" rows="25" placeholder="내용을 입력해주세요" required></textarea> 
		</div>
		
		<div class="writeButton">
			<button type="submit" id="submit">글 등록</button>
			<button id="list">목록으로</button>
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
            
            const submitButton = document.getElementById('submit');
            submitButton.addEventListener('click', () => {
              alert('글을 등록하시겠습니까?');
            });
            
            document.querySelector("#list").addEventListener("click", function(e){
            	e.preventDefault();
            	location.href='/withboard/withBoardList';
            })
        </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>