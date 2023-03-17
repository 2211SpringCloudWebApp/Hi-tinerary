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
		                	<div class="frameDiv" ${status.index < 12 ? '' : 'style="display: none;"'}>
		                        <img class="frame" src="../../../resources/images/ticketframe1.png">
		                        <a href="/tour/tourBoardDetail?tourNo=${tour.tourNo }">
		                            <img class="inframe" src="${tour.thumbnail != null ? tour.thumbnail.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noThumbnail.png'}">
		                        </a>
		                        <p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate }"/></p>
		                        <p class="tourTitle">${tour.tourTitle }</p>
		                        <p class="tourContent">${tour.tourContent }<p>
		                    </div>
		                </c:forEach> 
		                
<!--					    <c:forEach items="${tList}" var="tour">
					        <div class="frameDiv">
					            <img class="frame" src="../../../resources/images/ticketframe1.png">
					            <a href="/tour/tourBoardDetail?tourNo=${tour.tourNo}">
					                <img class="inframe" src="${tour.thumbnail != null ? tour.thumbnail.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noThumbnail.png'}">
					            </a>
					            <p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate}"/></p>
					            <p class="tourTitle">${tour.tourTitle}</p>
					            <p class="tourContent">${tour.tourContent}<p>
					        </div>
					    </c:forEach>
						<button id="loadMore">더보기</button>-->
						
						
						<input type="hidden" id="page" value="${pi.currentPage }">
						<input type="hidden" id="perPage" value="${pi.postingLimit }">
						<input type="hidden" id="totalPage" value="${pi.lastPage }">
					
 						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							
							<c:url var="pageUrl" value="/tour/tourBoardList">
								<c:param name="page" value="${p}"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a> 
							
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
	        
            
		            
		            //더보기 클릭하면 다음 12개 div 보여주기
		            document.addEventListener("DOMContentLoaded", function() {
				    var loadMoreBtn = document.getElementById("loadMore");
				    var currentPage = parseInt(document.getElementById("currentPage").value); // 현재 페이지 번호
				    var postingLimit = parseInt(document.getElementById("postingLimit").value); // 한 페이지당 보여줄 게시물의 수
				    var lastPage = parseInt(document.getElementById("lastPage").value); // 마지막 페이지 번호
				    
				    loadMoreBtn.addEventListener("click", function() {
				        if (currentPage >= lastPage) {
				            return; // 모든 데이터를 가져왔으면 함수 종료
				        }
				        
				        var xhr = new XMLHttpRequest();
				        xhr.onreadystatechange = function() {
				            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
				                var response = xhr.responseText;
				                // 가져온 데이터를 페이지에 추가
				                var div = document.createElement("div");
				                div.innerHTML = response.trim();
				                var tList = div.querySelectorAll(".frameDiv");
				                var len = tList.length;
				                for (var i = 0; i < len; i++) {
				                    document.getElementById("tList").appendChild(tList[i]);
				                }
				                // 페이지 번호, loadMore 버튼의 상태 갱신
				                currentPage += 1;
				                document.getElementById("currentPage").value = currentPage;
				                if (currentPage >= lastPage) {
				                    loadMoreBtn.style.display = "none";
				                }
				            }
				        };
				        xhr.open("GET", "/tour/tourBoardList?page=" + (currentPage + 1));
				        xhr.send();
				    });
				});
		            
		            
            	</script>
	            
	     	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	     	    

	</body>
</html>