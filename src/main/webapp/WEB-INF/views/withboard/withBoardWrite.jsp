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
            <div class="">
                <label>모집인원</label> 
				<input type="range" min="1" max="10" value="1" class="slider" id="myRange" name="maxPeople"> 
				<span id="value"></span>명<br>
				<label>날짜 선택</label> 
				<input type="date" name="start-Date"> - <input type="date" name="end-Date"><br> 
				<!-- <input type="file" name="uploadFile"><br> -->
				<div class="oneHundredX8times"> 
                        <div contentEditable="true" id="textarea"></div>
					    <input type="hidden" name="withContent" value=" ">
                    </div>
                    <div class="oneHundred"> 
                        <div class="infos">본문이미지첨부</div>
                        <div class="filebox">
                            <label for="withImage">파일찾기</label>
                            <input class="upload-name" id="upload-img" value="jpg, png 파일만 선택해 주세요" placeholder="본문이미지">
                            <input type="file" name="uploadFile" id="withImage">
                        </div>                 
                    </div>
				<!-- <input type="text" placeholder="작성자"><br> -->
				<input type="text" placeholder="ex) 12월 3박 4일 강릉 바다 보러갈 동행 3명 구해요" name="boardTitle"><br>
				<textarea name="boardContent" id="" cols="30" rows="10"></textarea><br> 
                
                <div class="writeButton">
                    <button type="submit" id="submit">글 올리기</button>
                    <button id="list">목록보기</button>
                </div>
            </div>
        </form>

        <script>
            var slider = document.getElementById("myRange");
            var output = document.getElementById("value");
            output.innerHTML = slider.value;

            slider.oninput = function () {
                output.innerHTML = this.value;
            }

            
            const tourImageInput = document.getElementById('withImage');
            const tourContentDiv = document.querySelector('div[name="withContent"]');

            withImageInput.addEventListener('change', function() {
                const files = this.files;
                if (files.length > 0) {
                    const filename = files[0].name;
                    const uploadName = document.querySelector('#upload-img');
                    uploadName.value = filename;

                    const file = files[0];
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        const imageUrl = event.target.result;
                        const imgHtml = `<img src="${imageUrl}" alt="">`;
                        tourContentDiv.innerHTML += imgHtml;
                    };
                    reader.readAsDataURL(file);
                }
            });
            
			const tourContentDiv1 = document.querySelector('div#textarea');
            const tourContentInput1 = document.querySelector('input[name="withContent"]');

            tourContentDiv1.addEventListener('input', function() {
            	console.log("test");
                tourContentInput1.value = tourContentDiv1.innerHTML;
            });
        </script>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>