<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품 게시물 수정</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourBoardModifyView.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			 <main id="tourBoardWrite">
                <div id="boardTitle">
                    <div id="bar">  </div>
                    <p>투어 / 패키지 상품 글 수정</p>                    
                </div>


                <div id="writeFrame">
                    <form action="/tour/modify" method="post" enctype="multipart/form-data">
                         
                         
                            <input type="hidden" name="tourNo" value="${tour.tourNo }">
                            <input type="hidden" name="userNo" value="${tour.userNo }">
    
                            <div class="oneHundred"> 
                                <div class="infos">제목</div>
                                <div><input type="text" name="tourTitle"  value="${tour.tourTitle }"></div>
                            </div>	
                            <div class="double-half">
                                <div class="half"> 
                                    <div class="infos">가격</div>
                                    <div><input type="text" name="price" value="${tour.price }"></div>
                                </div>
                                <div class="half"> 
                                    <div class="infos">여행기간</div>
                                    <div><input type="text" name="startDate" placeholder="시작일시(yyyymmddhh)" value="<fmt:formatDate pattern='yyyyMMddHH' value='${tour.startDate}'/>"></div>
                                    ~&nbsp;
                                    <div><input type="text" name="endDate" placeholder="종료일시(yyyymmddhh)" value="<fmt:formatDate pattern='yyyyMMddHH' value='${tour.endDate }'/>"></div>
                                </div>	
                            </div>
                            <div class="double-half">
                                <div class="half"> 
                                    <div class="infos">모집기간</div>
                                    <div><input type="text" name="deadline" value="<fmt:formatDate pattern='yyyyMMdd' value='${tour.deadline}'/>" placeholder="yyyyMMdd숫자8자리"></div>

                                </div> 
                                <div class="half">                         
                                    <div class="infos1">최소인원</div>
                                    <div><input type="number" name="minPeople" value="${tour.minPeople }"></div>
                                    <div class="infos1">최대인원</div>
                                    <div><input type="number" name="maxPeople" value="${tour.maxPeople }"></div>
                                </div>
                            </div>
                            <div class="oneHundredX8times"> 
                               
                                <div contentEditable="true" id="textarea">${tour.tourContent }</div>
								<input type="hidden" name="tourContent" value="">
                            </div>	
                            
                            <div class="oneHundred"> 
                                <div class="infos">썸네일</div>
                                <div class="filebox">
                                    <label for="thumbnail">파일바꾸기</label>
                                    <input class="upload-name" value="${tour.thumbnail }"">
                                    <input type="file" name="thumbnail" id="thumbnail">
                                </div>           
                            </div>	
                            <div class="oneHundred"> 
                                <div class="infos">본문이미지첨부</div>
                                <div class="filebox">
                                    <label for="tourImage">파일바꾸기</label>
                                    <input class="upload-name" id="upload-img" value="${tour.tourImage }">
                                    <input type="file" name="tourImage" id="tourImage">
                                </div>                                                                                   
                            </div>
                            <div class="double-half">	
                                <div id="half-button1">
                                    <button id="up" >글올리기</button>
                                </div>
                                <div id="half-button2">  				
                                    <a href="/tour/tourBoardList"><button type="button" id="back" >페이지나가기</button></a>
                                </div>
                            </div>    
                        </form>  
                    </div>
                </main>
                
            
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	    
	    <script>
	    
	    function updateFilename(input) {
	    	  // 파일 선택 창에서 취소 버튼을 누르면 value를 비웁니다.
	    	  if (input.value === "") {
	    	    input.previousElementSibling.value = "";
	    	  } else {
	    	    // 파일 이름에서 확장자를 제거합니다.
	    	    let filename = input.value.split("\\").pop().split("/").pop();
	    	    let extensionIndex = filename.lastIndexOf(".");
	    	    if (extensionIndex !== -1) {
	    	      filename = filename.substring(0, extensionIndex);
	    	    }
	    	    // value를 파일 이름으로 업데이트합니다.
	    	    input.previousElementSibling.value = filename;
	    	  }
	    	}
	    
	    
	    
	    //썸네일첨부
	    const thumbnailInput = document.getElementById('thumbnail');

        thumbnailInput.addEventListener('change', function() {
        const files = this.files;
        if (files.length > 0) {
            const filename = files[0].name;
            const uploadName = document.querySelector('.upload-name');
            uploadName.value = filename;
        }
        });

        //본문이미지첨부해서 보이기(동작안함ㅠ)
        const tourImageInput = document.getElementById('tourImage');
        const tourContentDiv = document.querySelector('div[id="textarea"]');

        tourImageInput.addEventListener('change', function() {
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
              		  console.log(imgHtml);
                };
                reader.readAsDataURL(file);
            }
        });
        
        
        //div내용을 input=text로 보내기
        const tourContentDiv1 = document.querySelector('div#textarea');
        const tourContentInput1 = document.querySelector('input[name="tourContent"]');

        tourContentDiv1.addEventListener('input', function() {
        	console.log("test");
            tourContentInput1.value = tourContentDiv1.innerHTML;
        });
        
	    </script>
	</body>
</html>