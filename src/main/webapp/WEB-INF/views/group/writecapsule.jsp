<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>캡슐 작성 페이지</title>
	<link rel="stylesheet" href="../../../resources/css/withBoardWrite.css">
	</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	 <main id="withBoardWrite">
        <div id="withTitle">
            <div id="bar_title"></div>
            <p>${groupName } 그룹</p>
        </div>
		<div id="withSubTitle">
			<div id="bar_subtitle"></div>
			<p>타임캡슐 글쓰기</p>
		</div>
		<div class="writeFrame">
		<form action="/group/write/capsule" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<input type="hidden" value="${loginUser.userNo }" name="userNo">
		<input type="hidden" value="${groupNo}" name="groupNo">
		<div class="withTitle">
			<input type="text" placeholder="ex) 끼얏호우" name="capsuleTitle" <c:if test="${timecapsule ne null }">value="${timecapsule.capsuleTitle }"</c:if>required>
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

		<div class="withConetnt">
			<textarea style="width:960px;" name="capsuleContent" id="withContent" cols="136" rows="25" placeholder="내용을 입력해주세요" required><c:if test="${timecapsule ne null }">${timecapsule.capsuleSubject }</c:if></textarea> 
		</div>
		
		<div class="writeButton">
			<button type="submit" id="submit">글 등록</button>
			<button id="list" onclick="location.href='/withboard/withBoardList'">목록으로</button>
		</div>
    </form>
    </div>
	</main>

        <script>
            /* 이미지 첨부하는 부분 */
            const container = document.getElementById("Container");
            const fileInput = document.getElementById("withImage");
            let imgElement = null;

            fileInput.addEventListener("change", function() {
              const file = this.files[0];

              // 파일이 이미지 파일인 경우
              if (file.type.match("image.*")) {
            	container.innerHTML = "";
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
            </script>
 	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>