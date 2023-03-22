<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 페이지</title>
    	<link rel="stylesheet" href="../../../../resources/css/groupinfo.css">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		<div class="group-container">
			<div class="group-nav">
	            <p>${loginUser.userNickname }</p>
	            <a class="nav-btn" href="/group/groupinfopage?groupIndex=-1">그룹만들기</a>
	            <c:forEach items="${gList}" var="group" varStatus="status">
	            	<c:if test="${group.dateGap < 3 }">
	            		<a class="nav-btn" href="/group/groupinfopage?groupIndex=${status.index }">${group.groupName }</a>
	            	</c:if>
	            	<c:if test="${group.dateGap >= 3 }">
	            		<form action="/sendMail" class="capsule-form" method="post">
	            			<input type="hidden" name="groupNo" value="${group.groupNo}">
	            			<input type="submit" class="capsule-submit-btn" value="${group.groupName }" onclick="return capsulesend()">
	            		</form>
	            	</c:if>
	            </c:forEach>
	        </div>
			<div class="group-area">
				<c:if test="${groupIndex eq -1}">
					<form action="/group/register.do" method="post">
					그룹명 : <input type="text" name="groupName" required>
					<div>
					시작날짜 : <input min="${now }" type="date" name="startDate" onchange="startDecide()" required>
					종료날짜 : <input min="${now }" type="date" name="endDate" onchange="endDecide()">
					</div>
					<div>
					시간추가 : on <input type="radio" name="addtime" onclick="addTime();"> 
							   off <input type="radio" name="addtime" onclick="removeTime();" checked>
					</div>
					최대인원 : <input type="number" min="2" max="5" name="maxPeople">
					<div>
					<input type="submit"> <a href="#">321</a>
					</div>
					</form>	
				</c:if>
				<c:if test="${group ne null }">
					<c:if test="${groupUserView eq 'F' }">
			            <div class="mypage-title">
			                <p>${group.groupName }</p>
			            </div>
						    <div class="info-area">
				                <div class="area1">
				                    <div class="start-date"><p class="date-title">시작날짜 :</p> <p class="group-date"><fmt:formatDate value="${group.startDate }" pattern="yyyy-MM-dd ahh:mm" /></p></div>
				                    <div class="end-date"><p class="date-title">종료날짜 : </p><p class="group-date"><fmt:formatDate value="${group.endDate }" pattern="yyyy-MM-dd ahh:mm" /></p></div>
				                </div>
				                <div class="area2">
				                    <p>그룹인원 ${group.currentPeople }/${group.maxPeople }</p>
				                    <a href="/group/groupinfopage?groupIndex=${groupIndex }&groupUserView=T">인원조회</a>
				                </div>
				            </div>
				        <div class="empty"></div>
				        <div class="area3">
				        <div class="capsule-amount">
				        	<p class="number">${capsuleCount }</p><p class="capsule-info">개의 캡슐이 작성됨</p>
				        </div> 
				        	<form action="/group/write/capsuleView" method="POST">
				        		<input type="hidden" name="groupNo" value="${group.groupNo }">
				        		<input type="hidden" name="groupName" value="${group.groupName }">
				        		<input class="capsule-btn" type="submit" value="캡슐쓰기">
				        	</form>
				        </div>
						<div>
							<c:if test="${gBList eq null }">
								<h1 class="empty-board">그룹 게시글이 없어요!</h1>
								<form action="/group/board/writeView" method="post" class="empty-btn">
								<input type="hidden" name="groupIndex" value="${groupIndex }">
								<input type="hidden" name="groupName" value="${group.groupName }">
								<input type="hidden" name="groupNo" value="${group.groupNo }">
								<input id="writeBoard" type="submit" value="글쓰기">
							</form>
							</c:if>
							<c:if test="${gBList ne null }">
								<table class="groupBoardList-tbl">
									<thead>
										<tr>
											<th width="300px">제목</th>
											<th width="180px">작성일</th>
											<th width="130px">작성자</th>
											<th width="60px">수정</th>
											<th width="60px">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${gBList}" var="groupBoard">
											<tr>
												<td class="board-title"><a href="/group/board/detail?groupBoardNo=${groupBoard.boardNo}&groupIndex=${groupIndex}">${groupBoard.boardTitle }</a></td>
												<td><fmt:formatDate value="${groupBoard.writeDate }" pattern="yyyy-MM-dd ahh:mm" /></td>
												<td>${groupBoard.userNickname }</td>
													<td>
														<form action="/group/board/updateView" method="post" onsubmit="return BoardBtn('${groupBoard.userNo}')">
															<input type="hidden" name="groupName" value="${group.groupName }">
															<input type="hidden" name="groupBoardNo" value="${groupBoard.boardNo}">
															<input type="hidden" name="groupIndex" value="${groupIndex }">
															<input class="modify-btn" type="submit" value="수정">
														</form>
													</td>
													<td>
														<form action="/group/board/delete" method="post" onsubmit="return BoardBtn('${groupBoard.userNo}')">
															<input type="hidden" name="groupIndex" value="${groupIndex }">
															<input type="hidden" name="groupBoardNo" value="${groupBoard.boardNo}">
															<input class="delete-btn" type="submit" value="삭제" >
														</form>
													</td>
											</tr>								
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="5" id="board-navi">
												<c:if test="${pi.currentPage ne '1' }">
													<a class="pagenav" href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${1}">&lt;&lt;</a>&nbsp;
													<a class="pagenav" href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${pi.currentPage - 1}">&lt;</a>&nbsp;
												</c:if>
												<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
														<a href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${p}">${p}</a>&nbsp;
												</c:forEach>
												<c:if test="${pi.currentPage ne pi.maxNavi }">
													<a class="pagenav" href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${pi.currentPage + 1}">&gt;</a>&nbsp;
													<a class="pagenav" href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${pi.maxNavi}">&gt;&gt;</a>&nbsp;
												</c:if>
											</td>
										</tr>
									</tfoot>
								</table>
							<form action="/group/board/writeView" method="post" class="list-btn">
								<input type="hidden" name="groupIndex" value="${groupIndex }">
								<input type="hidden" name="groupName" value="${group.groupName }">
								<input type="hidden" name="groupNo" value="${group.groupNo }">
								<input id="writeBoard" type="submit" value="글쓰기">
							</form>
							</c:if>
				        </div>
					</c:if>
					<c:if test="${groupUserView eq 'T' }">
						<c:if test="${group.leaderUserNo eq sessionScope.loginUser.userNo}">
							<div class="mypage-title">
				                <p class="title">${group.groupName }</p>
				            </div>
				            <div>
				            	<table class="group-memebertbl">
				            		<tr>
				            			<th width="150">닉네임</th>
				            			<th width="300">메일주소</th>
				            			<th width="60">나이</th>
				            			<th width="60">성별</th>
				            			<th width="100">버튼</th>
				            		</tr>
				            		<c:forEach items="${uList }" var="User">
					            		<tr>
					            			<td>${User.userNickname }</td>
					            			<td>${User.userEmail }</td>
					            			<c:if test="${User.userBirthDate > 0}">
					            				<td>${User.userBirthDate }</td>
					            			</c:if>
					            			<c:if test="${User.userBirthDate < 0}">
					            				<td>${100 + User.userBirthDate }</td>
					            			</c:if>
					            			<td>${User.userGender }</td>
					  	                    <td>
					  	                    	<c:if test="${group.leaderUserNo ne User.userNo}">
						  	                    	<form action="/group/dropUser" method="post" class="member-list">
						  	                    		<input type="hidden" name="groupNo" value="${group.groupNo }">
						  	                    		<input type="hidden" name="userNo" value="${User.userNo }">
						  	                    		<input type="submit" value="내보내기">
						  	                    	</form>
					  	                    	</c:if>
					  	                    </td>
					            		</tr>
				            		</c:forEach>
				            	</table>
				            </div>						
						</c:if>
						<c:if test="${group.leaderUserNo ne sessionScope.loginUser.userNo}">
							<div class="title-area">
				                <h1 class="title">${group.groupName }</h1> 
				                <form action="/group/dropUser" method="post">
					  	        	<input type="hidden" name="groupNo" value="${group.groupNo }">
					  	            <input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
					  	            <input type="submit" value="나가기">
					  	        </form>
				            </div>
				            <div>
				            	<table>
				            		<tr>
				            			<th width="150">닉네임</th>
				            			<th width="300">메일주소</th>
				            			<th width="60">나이</th>
				            			<th width="60">성별</th>
				            		</tr>
				            		<c:forEach items="${uList }" var="User">
					            		<tr>
					            			<td>${User.userNickname }</td>
					            			<td>${User.userEmail }</td>
					            			<td>${User.userBirthDate }</td>
					            			<td>${User.userGender }</td>
					            		</tr>
				            		</c:forEach>
				            	</table>
				            </div>				
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
		<script>
			function startDecide(){
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				if(startDate.value > endDate.value){
					endDate.value = startDate.value;
				}
			}
			
			function endDecide(){
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				if(startDate.value > endDate.value){
					alert("종료날짜가 시작날짜보다 이릅니다.")
					endDate.value = startDate.value;
				}
			}
		
			function addTime(){
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				if(startDate.value != "" && endDate.value != ""){
					startDate.readOnly = true;
					endDate.readOnly = true;
					if(document.querySelector("[name=startTime]") == null && document.querySelector("[name=endTime]") == null){
						var a = document.createElement('input');
						a.setAttribute("type", "time");
						a.required = true;
						var b = a.cloneNode(false);
						a.setAttribute("name", "startTime");
						a.setAttribute("onchange", "startTimeDecide()")
						b.setAttribute("name", "endTime");
						b.setAttribute("onchange", "endTimeDecide()")
						startDate.after(a);
						endDate.after(b);						
					}
				}else{
					alert("날짜를 먼저 정해주세요")
					document.querySelectorAll("[name=addtime]")[1].checked = true;
				}
			}
			function removeTime(){
				var a = document.querySelector("[name=startTime]");
				var b = document.querySelector("[name=endTime]");
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				startDate.readOnly = false;
				endDate.readOnly = false;
				if(a != null && b != null){
					a.remove();
					b.remove();
				}
			}
			
			function startTimeDecide(){
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				if(startDate.value == endDate.value){
					var a = document.querySelector("[name=startTime]");
					var b = document.querySelector("[name=endTime]");
					b.value = "";
					b.min = a.value;					
				}
			}
			
			function endTimeDecide(){
				var a = document.querySelector("[name=startTime]");
				var b = document.querySelector("[name=endTime]");
				var startDate = document.querySelector("[name=startDate]")
				var endDate = document.querySelector("[name=endDate]")
				if(startDate.value == endDate.value){
					if(b.value < a.value){
						b.value = "";
						alert("종료시간이 더 이릅니다.")
					}					
				}
			}
			function BoardBtn(writer){
				if(writer == ${loginUser.userNo}){
					return true;
				}else{
					alert('권한없음');
					return false;
				}
			}
			function capsulesend(){
				return confirm("해당 그룹에 캡슐을 보내시겠습니까?");
			}
			document.querySelector(".group-nav a:nth-of-type(${groupIndex + 2})").style.backgroundColor = "#0F8D80";
		</script>
</html>