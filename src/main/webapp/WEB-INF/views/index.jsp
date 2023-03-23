<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<link rel="stylesheet" href="${path }../../../resources/css/index.css"/>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<main>
			<!-- 투어/패키지 상품 -->
			<div id="tourBoardList">
                <div id="boardTitle">
                    <div id="bar">  </div>
                    <p>투어 / 패키지 상품</p>
                </div>
                <div id="tourList">       	
					<c:forEach items="${tList}" var="tour" varStatus="status">
						<c:if test="${status.count <= 3}">
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
										</a>
									</div>
									<div class="startDateDiv">
										<p class="startDate"><fmt:formatDate pattern="MM월dd일 출발" value="${tour.startDate }"/></p>
									</div>
									<div class="tourTitle">${tour.tourTitle }</div>
									<div class="tourContent">${tour.tourContent}</div>
								</div>            
							</div>
						</c:if>
					</c:forEach> 	
					<div id="circleNav"> 
						<a href=""/tour/tourBoardList"">
							<div class="circleGreen"></div>
							<div class="circleYellow"></div>
							<div class="circleGreen"></div>
						</a>
					</div>	      
				</div>
			</div>
			
			
			
			
			<!-- 커뮤니티(동행찾기) -->
			<div id="withBoardList">
			 	<div id="boardTitle1">
                    <div id="bar1">  </div>
                    <p>커뮤니티</p>
                </div>
                <div id="boardSubTitle1">
                    <div id="subBar1">  </div>
                    <p>동행찾기</p>
                </div>
                
                   
                <div class="list_wrapper">
					<ul>
						<c:forEach items="${wList}" var="withBoard" begin="0" end="2">
							<c:set var="now" value="<%= new java.util.Date() %>" />
							<li class="${withBoard.endDate.getTime() < now.getTime() ? 'expired' : ''}">
								<div class="img">
									<a href="/withboard/withBoardDetail?boardNo=${withBoard.boardNo}">
										<img src="../../../${withBoard.boardImage}">
									</a>
								</div>
								<strong class="tit">${withBoard.boardTitle}</strong>
								<div class="withDate"> 
									<span class="date"> 
										<fmt:formatDate value="${withBoard.startDate}" pattern="yyyy-MM-dd" /> ~ 
										<fmt:formatDate value="${withBoard.endDate}" pattern="yyyy-MM-dd" />
									</span>
								</div>
								<div class="withWrite">
									<span class="writer">${withBoard.userNickname}</span> 
								</div>
								<div class="withPeople">
									<span class="people">${withBoard.currentPeople} / ${withBoard.maxPeople}</span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div style="display: flex; justify-content: center; align-items: center;">
					<div id="circleNav" style="item-align:center;">
						<a href="/withboard/withBoardList">
							<div class="circleGreen"></div>
							<div class="circleYellow"></div>
							<div class="circleGreen"></div>
						</a>	
					</div>
				</div>
			</div>
			
			<!-- 커뮤니티(자유게시판) -->
			<div id="freeBoardList">
				<div id="boardSubTitle2">
                    <div id="subBar2">  </div>
                    <p>자유게시판 <smarller style="font-size: 15px;">&nbsp;&nbsp;&nbsp;<a href="/freeboard/list">...더보기</a></smarller></p>
                </div>
				<div id="free-container">
					<c:forEach items="${fList}" var="freeboard" varStatus="i" begin="0" end="5">
					   <!-- 게시물 리스트 출력 -->
					   <table <c:if test="${i.count == 10}">style="border-bottom: solid 1px #FBD188;"</c:if> id="listTable">
					       <tr>
					           <td>
					               <c:if test="${pi.currentPage != 1}">
					                   ${pi.currentPage * 10 + i.count}
					               </c:if>
					               <c:if test="${pi.currentPage == 1}">
					                   ${i.count}
					               </c:if>
					           </td>
					           <td>
					               <c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
					               <c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
					           </td>
					           <td>
					               <a href="/freeboard/detail?boardNo=${freeboard.boardNo}">${freeboard.boardTitle}</a>
					           </td>
					           <td>
					               ${freeboard.userNickname}
					           </td>
					           <td>
					               <c:if test="${freeboard.boardHead == 'question'}">
					                   <c:if test="${freeboard.boardCheck == 0}">
					                       <div class="freespan" id ="freespan1">답변대기</div>
					                   </c:if>
					                   <c:if test="${freeboard.boardCheck == 1}">
					                       <div class="freespan" id ="freespan2">답변완료</div>
					                   </c:if>					
					               </c:if>
					           </td>
					       </tr>
					   </table>
					</c:forEach>
				</div>
			</div>
		</main>	
		
		 <script>
		      /////투어보드용 스크립트
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
		
		</script>
		
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
		
	</body>
</html>