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
		                <c:forEach items="${tList}" var="tour" varStatus="status">
		                	<div class="frameDiv" ${status.index < 9 ? '' : 'style="display: none;"'}>
		                        <img class="frame" src="../../../resources/images/ticketframe1.png">
		                        <a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">
		                            <img class="inframe" src="${tour.thumbnail != null ? tour.thumbnail.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noThumbnail.png'}">
		                        </a>
		                        <p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate }"/></p>
		                        <p class="tourTitle">${tour.tourTitle }</p>
		                        <p class="tourContent">${tour.tourContent }<p>
		                    </div>
		                    <button id="loadMore">더보기</button>
		                </c:forEach>
	                </div>
	                
	                
	               
	                
	            </main>
	            
	            
	            <script>
	         
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
	
		                const contentText = tourContent.textContent;
		                const contentChars = contentText.length;
	
		                // 글자 수가 최대 글자 수보다 큰 경우, 생략 부호로 대체
		                if (titleChars > maxChars) {
		                    const newTitle = titleText.substr(0, maxChars) + '...';
		                    tourTitle.textContent = newTitle;
		                }
	
		                if (contentChars > maxChars1) {
		                    const newContent = contentText.substr(0, maxChars1) + '...';
		                    tourContent.textContent = newContent;
		                }
		            });
	        
            
		            //더보기 클릭하면 다음 9개 div 보여주기
		            window.addEventListener('DOMContentLoaded', function() {
		                var page = 1;
		                var perPage = 9;
		                var totalPage = Math.ceil(${tList.size()} / perPage);

		                var loadMoreBtn = document.getElementById('loadMore');
		                loadMoreBtn.addEventListener('click', function() {
		                    page++;

		                    if (page > totalPage) {
		                        return;
		                    }

		                    var start = (page - 1) * perPage;
		                    var end = start + perPage;

		                    var tourList = document.getElementById('tourList');
		                    var frameDivs = tourList.querySelectorAll('.frameDiv');
		                    for (var i = start; i < end; i++) {
		                        if (frameDivs[i]) {
		                            frameDivs[i].style.display = 'block';
		                        }
		                    }
		                });
		            });
		            
		            
            	</script>
	            
	     	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	     	    

	</body>
</html>