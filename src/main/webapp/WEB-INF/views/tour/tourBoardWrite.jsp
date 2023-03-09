<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품게시판</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourBoardWrite.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			 <main id="tourBoardWrite">
                <div id="boardTitle">
                    <div id="bar">  </div>
                    <p>투어 / 패키지 상품 글쓰기</p>                    
                </div>


                <div id="writeFrame">
                <form action="/tour/tourBoardWriteUp" method="post" enctype="multipart/form-data">
                     
                     
                        <input type="hidden" name="tourNo">
                        <input type="hidden" name="userNo">

                        <div class="oneHundred"> 
                            <div class="infos">제목</div>
                            <div><input type="text" name="tourTitle"></div>
                        </div>	
                        <div class="half"> 
                            <div class="infos">가격</div>
                            <div><input type="text" name="price"></div>
                        </div>
                        <div class="half"> 
                            <div class="infos">여행기간</div>
                            <div><input type="text" name="startDate" placeholder="시작일"></div>
                            ~
                            <div><input type="text" name="endDate" placeholder="종료일"></div>
                        </div>	
                        <div class="half"> 
                            <div class="infos">모집기간</div>
                            <div><input type="text" name="deadline"></div>
                        </div>
                        <div class="half"> 
                            <div class="infos">최대인원</div>
                            <div><input type="text" name="maxPeople"></div>
                            <div class="infos">최소인원</div>
                            <div><input type="text" name="minPeople"></div>
                        </div>
                        <div class="oneHundredX8times"> 
                            <div><textarea name="tourContent" placeholder="상세내용"></textarea></div>              
                        </div>	
<!--                         <div class="oneHundred">  -->
<!--                             <div class="infos">썸네일</div> -->
<!--                             <div><input type="file" name="thumbnail"></div>            -->
<!--                         </div>	 -->
<!--                         <div class="oneHundred">  -->
<!--                             <div class="infos">본문이미지첨부</div> -->
<!--                             <div><input type="file" name="tourImage" ></div>    -->
                                      
<!--                         </div>	 -->
                        <div class="half">
                        <button id="up">글올리기</button>
                        </div>
                    </form>  
                    <div class="half">  				
                    <a href="/tour/tourBoardList"><button id="back">페이지나가기</button></a>
                    </div>
                </div>
            </main>
            
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	</body>
</html>