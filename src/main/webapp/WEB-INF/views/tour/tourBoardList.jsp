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
		                    <a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">
			                	<div class="frameDiv">
			                        <img class="frame" src="../../../resources/images/ticketframe1.png">
			                        <div class="thumbnailDiv">
		                            	<img class="inframe" src="../../../../${tour.thumbnail}">
			                        </div>
			                        <div class="startDateDiv">
			                        	<p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate }"/></p>
			                        </div>
			                        <div class="tourTitle">${tour.tourTitle }</div>
			                        <div class="tourContent">${tour.tourContent}</div>
			                    </div>
		                    </a>
		                </c:forEach> 		                
	                </div>
						
						
						<input type="hidden" id="page" value="${pi.currentPage }">
						<input type="hidden" id="perPage" value="${pi.postingLimit }">
						<input type="hidden" id="totalPage" value="${pi.lastPage }">
					
 						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							
							<c:url var="pageUrl" value="/tour/tourBoardList">
								<c:param name="page" value="${p}"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a> 
							
						</c:forEach> 
	                
	                
	                
	              
	                
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
            
	            //날짜 지난거 투명도 처리

	            
	            
</script>
		              
		            
            	</script>
	            
	     	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	     	    

	</body>
</html>