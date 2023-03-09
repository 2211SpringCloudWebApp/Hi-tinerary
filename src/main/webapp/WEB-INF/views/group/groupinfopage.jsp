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
        .title-area a{
        	text-decoration : none;
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
            td a{
            text-decoration : none;
        	text-align : center;
        	color : black;
        	background-color : green;
        	border : 1px solid green;
        	border-radius : 5px;
            }
/*             th:not(:first-of-type), td:not(:first-of-type){ */
/*                 border-left : 1px solid black; */
/*             } */
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
				시작날짜 : <input min="${now }" type="date" name="startDate" onchange="startDecide()">
				종료날짜 : <input type="date" name="endDate" onchange="endDecide()">
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
			        </div>
				</c:if>
				<c:if test="${groupUserView eq 'T' }">
					<c:if test="${group.leaderUserNo eq sessionScope.loginUser}">
						<div class="title-area">
			                <h1 class="title">${group.groupName }</h1>
			            </div>
			            <div>
			            	<table>
			            		<tr>
			            			<th width="150">닉네임</th>
			            			<th width="300">메일주소</th>
			            			<th width="60">나이</th>
			            			<th width="60">성별</th>
			            			<th width="100">버튼</th>
			            		</tr>
			            		<tr>
			            			<td>끼얏호우</td>
			            			<td>easea@iei.or.kr</td>
			            			<td>45</td>
			            			<td>남</td>
			  	                    <td><a href="#">내보내기</a></td>
			            		</tr>
			            	</table>
			            </div>						
					</c:if>
					<c:if test="${group.leaderUserNo ne sessionScope.loginUser}">
						<div class="title-area">
			                <h1 class="title">${group.groupName }</h1> <a href="#">나가기</a>
			            </div>
			            <div>
			            	<table>
			            		<tr>
			            			<th width="150">닉네임</th>
			            			<th width="300">메일주소</th>
			            			<th width="60">나이</th>
			            			<th width="60">성별</th>
			            		</tr>
			            		<tr>
			            			<td>끼얏호우</td>
			            			<td>easea@iei.or.kr</td>
			            			<td>45</td>
			            			<td>남</td>
			            		</tr>
			            	</table>
			            </div>				
					</c:if>
				</c:if>
			</c:if>
		</div>
		<script>
			function startDecide(){
				var startDate = document.querySelector("[name=startDate]");
				var endDate = document.querySelector("[name=endDate]");
                endDate.setAttribute('min', startDate.value);
                if(endDate.value < startDate.value){
                	endDate.value = startDate.value;
                }
			}
			function endDecide(){
				var endDate = document.querySelector("[name=endDate]");
				var startDate = document.querySelector("[name=startDate]");
                if(endDate.value < startDate.value){
                	endDate.value = startDate.value;
                }
			}
		</script>
	</body>
</html>