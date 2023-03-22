<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품게시판</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourBoardList.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			 <main id="tourBoardList">
	                <div id="boardTitle">
	                    <div id="bar">  </div>
	                    <p>투어 / 패키지 상품</p>
	                    <c:if test="${sessionScope.loginUser.userGrade == 2}">
						  <a href="/tour/tourBoardWrite"><button>새글쓰기</button></a>
						</c:if>
	                </div>                  
	                
	                <div id="tourList">
 		                <c:forEach items="${tList}" var="tour">
 		                <c:set var="now" value="<%= new java.util.Date() %>" />
		                	<div class="frameDiv" data-deadline="${tour.deadline}">
			                	<div class="${tour.deadline.getTime() < now.getTime() ? 'expired' : ''}">
			                        <img class="frame" src="../../../resources/images/ticketframe1.png">

			                        <div class="thumbnailDiv">
	
			                    		<a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">
			                    		
			                            	<c:choose>
											    <c:when test="${empty tour.thumbnail}">
											        <img class="inframe" src="/resources/images/noThumbnail.png" alt="No Thumbnail">
											    </c:when>
											    <c:otherwise>
											        <img class="inframe" src="../../../../${tour.thumbnail}" alt="Tour Thumbnail">
											    </c:otherwise>
											</c:choose>
				                    </div>
			                        <div class="startDateDiv">
			                        	<p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate }"/></p>
			                        </div>
			                        <div class="tourTitle">${tour.tourTitle }</div>
			                        <div class="tourContent">${tour.tourContent}</div>
			                    		</a>
				            	</div>            
			                </div>
		                </c:forEach> 		                
	                </div>
						
						

 					
	                <!-- 페이징 -->
	               <table id="pagefooter">
						<tr>
							<td colspan="5" id="board-navi">
							<input id="page" type="hidden" value="${pi.currentPage }">
								<c:if test="${pi.currentPage ne '1' }">
									<a href="/tour/tourBoardList?page=${pi.currentPage - 1}">&lt;</a>&nbsp;
								</c:if> 
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
									<a href="/tour/tourBoardList?page=${p}" class="pageNavi">${p}</a>&nbsp;
								</c:forEach> 
								<c:if test="${pi.currentPage ne pi.maxNavi }">
									<a href="/tour/tourBoardList?page=${pi.currentPage + 1}">&gt;</a>&nbsp;
								</c:if> 
							</td>
						</tr>
					</table>
	              
	                
	            </main>
	            
	            
	            <script>
	            window.onload = function() {
	                // 제목 글자수 제한
	                const maxChars = 13;

	                // 본문 글자수 제한
	                const maxChars1 = 43;

	                // Iterate over each .frameDiv element
	                const frameDivs = document.querySelectorAll('.frameDiv');
	                frameDivs.forEach(frameDiv => {
	                    const tourTitle = frameDiv.querySelector('.tourTitle');
	                    const tourContent = frameDiv.querySelector('.tourContent');

	                    // 글자 수 확인
	                    const titleText = tourTitle.textContent;
	                    const titleChars = titleText.length;

	                    const contentText = tourContent.innerHTML; // 수정
	                    const contentChars = contentText.length;

	                    // 글자 수가 최대 글자 수보다 큰 경우, 생략 부호로 대체
	                    if (titleChars > maxChars) {
	                        const newTitle = titleText.substr(0, maxChars) + '...';
	                        tourTitle.textContent = newTitle;
	                    }

	                    if (contentChars > maxChars1) {
	                        const newContent = contentText.substr(0, maxChars1) + '...';
	                        tourContent.innerHTML = newContent; // 수정
	                    }
	                });
	            }
            
	            //날짜 지난거 투명도 처리... 동작  안함 살려줘
// 					const frameImgs = document.querySelectorAll('.frameDiv');
// 					const currentTime = new Date().getTime();
// 					frameImgs.forEach(function(frameImg) {
// 					  const deadline = new Date.getTime();
// 					  if (currentTime > deadline) {
// 					    frameImg.style.opacity = '0.1';
// 					    frameImg.style.display = 'block';
// 					  }
// 					});
// 				    console.log(currentTime);
// 				    console.log("${tour.deadline}")->못불러옴
// 				    Fri Mar 03 00:00:00 KST 2023 아 뭔데

		         

// 페이징 디자인
		var page = document.querySelector("#page").value
            var pageNavi = document.querySelectorAll(".pageNavi")
            
            for(let i = 0; i < pageNavi.length; i++) {
                if (pageNavi[i].innerHTML == page) {
                	pageNavi[i].style.fontSize = '40px';
                	pageNavi[i].style.color = '#0F8D80';
                }
            }    
		            
            	</script>
	            
	     	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	     	    

	</body>
</html>