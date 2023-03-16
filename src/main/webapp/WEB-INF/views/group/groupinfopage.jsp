<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 페이지</title>
		<style>
        html, body{
            width: 1200px;
            margin : 0 auto;
        }
        .title-area{
            border-bottom: 1px solid black;
            width: 820px;
            margin : 20px auto; 
            display : flex;
        }
        .title{
            margin-top : 5px;
            margin-bottom: 0px;
            margin-left : 30px;
            margin-right : 0px;
            width : 500px
        }
        .title-area input{
        	text-align : center;
        	color : black;
        	height : 20px;
        	width : 70px;
        	margin-top : 20px;
        	margin-left : 200px;
        	background-color : green;
        	border : 1px solid green;
        	border-radius : 5px;
        }
        #group-nav{
            float: left;
            width: 280px;
            border: 1px solid green;
            margin : 0 10px;
        }
            #group-nav p{
                margin: 5px 0px;
                font-size: 25px;
                text-align: center;
            }
            #group-nav a{
            	text-decoration : none;
            	color : black;
            	margin : 20px auto;
            	text-align : center;
                background-color: darkgray;
                border: 1px solid darkgray;
                border-radius: 15px;
                padding: 10px 65px;
                display : block;
                width : 120px;
            }
                #group-nav a:nth-of-type(${groupIndex+2}){
 				color : white;
                background-color: pink;
                border: 1px solid pink;

            }
        #group-area{
            float: left;
            width:860px;
            border: 1px solid green;
            margin : 0 15px;
        }
        #info-area{
            height: 100px;
        }
        #area1{
            float: left;
            font-weight: bold;
            font-size : 20px
        }
            #area1 p:first-of-type{
                margin : 5px 0px;
                margin-left: 40px;                
            }
            #second-p{
                margin : 5px 0px;
                margin-left: 20px; 
            }
        #area2{
            float: right;
            margin-right: 30px;
        }
            #area2 p{
                margin-top : 5px;
                font-weight: bold;
                font-size: 20px;
            }
            #area2 a{
                text-decoration: none;
                color : black;
                background-color: green;
                padding : 5px 20px;
                margin : 5px;
            }
            #area3{
                margin-left: 20px;
            }
                #area3 button{
                    text-decoration: none;
                    color: black;
                    background-color: pink;
                    padding : 10px 40px;
                    border: 1px solid pink;
                    border-radius: 15px;
                }
                #area3 p{
                    margin-left: 20pxpx;
                }
            table{
            	margin : 0px auto;
            }
            th{
            	font-size : 25px;
            }
            th, td{
                text-align: center;
                padding :5px;
            }
            td{
            	border-bottom : 1px dashed black;
            }
            #groupList-tbl input{
	        	text-align : center;
	        	color : black;
	        	background-color : green;
	        	border : 1px solid green;
	        	border-radius : 5px;
            }
            #writeBoard{
            	text-decoration: none;
            	font-size : 15px;
                color : white;
                background-color: green;
            	float : right;
            	margin-right : 30px;
            	margin-bottom : 30px;
            	margin-top : 20px;
            	border : 1px solid green;
            	border-radius : 5px;
            }
            #board-navi a{
            	text-decoration : none;
            	color : black;
            }
            #groupBoardList-tbl td:nth-of-type(4) input{
            	text-align : center;
	        	color : white;
	        	background-color : #F39081;
	        	border : 1px solid #F39081;
	        	border-radius : 5px;
            }
            #groupBoardList-tbl td:nth-of-type(5) input{
            	text-align : center;
	        	color : white;
	        	background-color : #FBD188;
	        	border : 1px solid #FBD188;
	        	border-radius : 5px;
            }
    	</style>
	</head>
	<body>
		<div id="group-nav">
            <p>123</p>
            <a href="/group/groupinfopage?groupIndex=-1">그룹만들기</a>
            <c:forEach items="${gList}" var="group" varStatus="status">
            	<a href="/group/groupinfopage?groupIndex=${status.index }">${group.groupName }</a>
            </c:forEach>
        </div>
		<div id="group-area">
			<c:if test="${groupIndex eq -1}">
				<form action="/group/register.do" method="post">
				그룹명 : <input type="text" name="groupName">
				<div>
				시작날짜 : <input min="${now }" type="date" name="startDate" onchange="startDecide()" required>
				종료날짜 : <input min="${now }" type="date" name="endDate" onchange="endDecide()">
				</div>
				<div>
				시간추가 : on <input type="radio" name="addtime" onclick="addTime();"> 
						   off <input type="radio" name="addtime" onclick="removeTime();" checked>
				</div>
				최대인원 : <input type="text" name="maxPeople">
				<div>
				<input type="submit"> <a href="#">321</a>
				</div>
				</form>	
			</c:if>
			<c:if test="${group ne null }">
				<c:if test="${groupUserView eq 'F' }">
		            <div class="title-area">
		                <h1 class="title">${group.groupName }</h1>
		            </div>
				    <div id="info-area">
		                <div id="area1">
		                    <p>시작날짜 ~ 종료날짜</p>
		                    <p id="second-p">${group.startDate } ~ ${group.endDate }</p>
		                </div>
		                <div id="area2">
		                    <p>그룹인원 ${group.currentPeople }/${group.maxPeople }</p>
		                    <a href="/group/groupinfopage?groupIndex=${groupIndex }&groupUserView=T">인원조회</a>
		                </div>
		            </div>
		            <div id="area3">
		                <button>타임캡슐 작성/수정</button>
		                <p>개의 캡슐이 작성됨</p>
		            </div>
					<div>
						<c:if test="${gBList eq null }">
							<h1>그룹 게시글이 없어요!</h1>
						</c:if>
						<c:if test="${gBList ne null }">
							<table id="groupBoardList-tbl">
								<thead>
									<tr>
										<th width="200px">제목</th>
										<th width="140px">작성일</th>
										<th width="180px">작성자</th>
										<th width="60px">수정</th>
										<th width="60px">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gBList}" var="groupBoard">
										<tr>
											<td><a href="/group/board/detail?groupBoardNo=${groupBoard.boardNo}&groupIndex=${groupIndex}">${groupBoard.boardTitle }</a></td>
											<td>${groupBoard.writeDate }</td>
											<td>${groupBoard.userNickname }</td>
												<td>
													<form action="/group/board/updateView" method="post" onsubmit="return BoardBtn('${groupBoard.userNo}')">
														<input type="hidden" name="groupBoardNo" value="${groupBoard.boardNo}">
														<input type="hidden" name="groupIndex" value="${groupIndex }">
														<input type="submit" value="수정">
													</form>
												</td>
												<td>
													<form action="/group/board/delete" method="post" onsubmit="return BoardBtn('${groupBoard.userNo}')">
														<input type="hidden" name="groupIndex" value="${groupIndex }">
														<input type="hidden" name="groupBoardNo" value="${groupBoard.boardNo}">
														<input type="submit" value="삭제" >
													</form>
												</td>
										</tr>								
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="5" id="board-navi">
											<c:if test="${pi.currentPage ne '1' }">
												<a href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${pi.currentPage - 1}">&lt;</a>&nbsp;
											</c:if>
											<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
													<a href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${p}">${p}</a>&nbsp;
											</c:forEach>
											<c:if test="${pi.currentPage ne pi.maxNavi }">
												<a href="/group/groupinfopage?groupIndex=${groupIndex }&currentPage=${pi.currentPage + 1}">&gt;</a>&nbsp;
											</c:if>
										</td>
									</tr>
								</tfoot>
							</table>
						</c:if>
						<form action="/group/board/writeView" method="post">
							<input type="hidden" name="groupIndex" value="${groupIndex }">
							<input type="hidden" name="groupName" value="${group.groupName }">
							<input type="hidden" name="groupNo" value="${group.groupNo }">
							<input id="writeBoard" type="submit" value="글쓰기">
						</form>
			        </div>
				</c:if>
				<c:if test="${groupUserView eq 'T' }">
					<c:if test="${group.leaderUserNo eq sessionScope.loginUser}">
						<div class="title-area">
			                <h1 class="title">${group.groupName }</h1>
			            </div>
			            <div>
			            	<table id="groupList-tbl">
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
				            			<td>${User.userBirthDate }</td>
				            			<td>${User.userGender }</td>
				  	                    <td>
				  	                    	<c:if test="${group.leaderUserNo ne User.userNo}">
					  	                    	<form action="/group/dropUser" method="post">
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
					<c:if test="${group.leaderUserNo ne sessionScope.loginUser}">
						<div class="title-area">
			                <h1 class="title">${group.groupName }</h1> 
			                <form action="/group/dropUser" method="post">
				  	        	<input type="hidden" name="groupNo" value="${group.groupNo }">
				  	            <input type="hidden" name="userNo" value="${sessionScope.loginUser }">
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
		<script>
			var viewDate = document.querySelector("#second-p")
			viewDate.innerHTML = viewDate.innerHTML.substr(0, 16) + viewDate.innerHTML.substr(21,19);
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
				if(writer == ${loginUser}){
					return true;
				}else{
					alert('권한없음');
					return false;
				}
			}
		</script>
	</body>
</html>