<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품게시판</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourBoardDetail.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<main id="tourBoardDetail">
	            <div id="boardTitle">
	                <div id="bar">  </div>
	                <p>투어 / 패키지 상품</p>                    
	            </div>

<!--  													${tour }  -->
			<input type="hidden" name="payuserNo" value="${sessionScope.loginUser.userNo }">	
                
            <div id="thumbnailAndInfos">
                <div id="thumbnail">
<!--                     520px x 520px <br> thumbnail -->
					<img src="../../../../${tour.thumbnail}">
                </div>
                <div id="tourInfos">
                    <div id="writerDiv">
                        <div>한투어</div>
                        <div>
                        	<c:if test="${sessionScope.loginUser.userNo == tour.userNo}">
	                        	<a href="/tour/tourBoardModifyView?tourNo=${tour.tourNo }">수정</a> | 
	                        	<a href="javascript:void(0);" onclick="removeCheck(${tour.tourNo});">삭제</a>
	                        </c:if>	
                        </div>
                    </div>
                    <div id="titleDiv">
<!--                         울릉도여행/포항영일만항 출발 울릉 크루즈 울릉도 3박4일 패키지/3월11일 출발 -->
                        ${tour.tourTitle }
                    </div>
                    <div id="priceDiv">
<!--                         396,000원 -->
						<fmt:formatNumber pattern="#,###,###" value="${tour.price }"/> 원
                    </div>
                    <div id="daysDiv">
<!--                         3/11토~3/14화 -->
                        <fmt:formatDate pattern="yy.MM.dd h시" value="${tour.startDate }"/>  
                        ~  
                        <fmt:formatDate pattern="yy.MM.dd h시" value="${tour.endDate }"/>  
                       
                    </div>
                    <div id="buyDiv">
                        <div>
	                        <c:if test= "${sessionScope.loginUser.userNickname ne null}"> 
							    <input type="hidden" name="payUserNo" value="${sessionScope.loginUser.userNo}">
							    <input type="hidden" name="tourNo" value="${tour.tourNo}">
	                        	<form action="/tour/tourBoardPayView" method="GET">
		                        	<c:choose>
									  <c:when test="${tour.currentPeople ne tour.maxPeople}">
									    <button id="pay">결제하기</button>
									  </c:when>
									  <c:otherwise>
									    <div>&nbsp;&nbsp;&nbsp;&nbsp;<b>모집이 마감되었습니다.</b></div>
									  </c:otherwise>
									</c:choose>
								</form>                  
	                        </c:if>
	                        <c:if test= "${sessionScope.loginUser.userNickname eq null}"> 
	                        	<button id="pay" onclick="payButtonClicked()">결제하기</button>                       
	                        </c:if>
                        </div>
                        <div>신고하기</div>
                    </div>
                    <div id="currentDiv">
                        <p>
	                        ${tour.currentPeople } / ${tour.maxPeople }명 정원<br>
	                        모집마감~ 
	                        <fmt:formatDate pattern="MM/dd" value="${tour.deadline }"/>
                        </p>
                    </div>    
                </div>    
            </div>
            <!-- 상세일정content, tourImg 보이는 영역 -->
            <div id="partition">
                <p>&nbsp;상 세 일 정 안 내&nbsp;</p>
            </div>
            <div id="tourContent">
                 ${tour.tourContent } <br>
                  <img src="../../../../${tour.tourImage }">
            </div>
            
            <!-- 댓글영역 -->
            <div id="replyDiv">
                <!-- 올라온댓글보기영역 -->
                 <c:forEach items="${comments}" var="comment" >
                 	
                 	<c:if test="${comment.depth==0 }">
		                <div class="printReply"> 	
		                	
<!-- 		                	${comment.commentNo }                 -->
		                    <div class="writerRe">${comment.userNickname }</div>
		                    <div class="commentedDiv">${comment.content }</div>
		                    <div class="commentedTimeDiv"><fmt:formatDate pattern="yy.MM.dd hh:MM" value="${comment.writeDate }"/></div>
		                    <c:if test="${loginUser.userNo == comment.userNo}"> 
		                    	<div class="modifyDeleteDiv">수정 삭제</div>   
		                    </c:if>	
		                    <c:if test="${loginUser.userNo != comment.userNo}"> 
		                    	<div class="modifyDeleteDiv">
			                    	<c:if test="${loginUser ne null }">
			                    		<button class="reReplyBtn" onclick="writeReply(this)">대댓글쓰기</button> 
			                    		&nbsp;신고
			                    	</c:if>	
		                    	</div>  
		                    	<!-- 대댓글쓰기영역 -->
				               		<form action="/tour/reReplyUp" method="post" class="reReplyForm">
				                <div class="writeReReply"> 
				               			<input type="hidden" name="userNo" value="${loginUser.userNo }">
				                    	<input type="hidden" name="tourNo" value="${tour.tourNo }">
				                    	<input type="hidden" name="userNickname" value="${loginUser.userNickname }">
				                    	<input type="hidden" name="refCommentNo" value="${comment.commentNo }">
				                        <div class="writerRe">${loginUser.userNickname}</div>
				                        <div class="commentDiv"><input type="text"  name="content"></div>
				                        <div class="writeButton">
				                            <button class="replyBtn" onclick="uploadReReply(this)">대댓글올리기</button>
				                	</form>
				                        </div>
				               </div> 
		                    </c:if>	  
		                </div>              
              	<!-- 대댓글보기 -->
	            		<c:forEach items="${comments }" var="reReply">	
		              		<c:if test="${reReply.depth==1 && reReply.refCommentNo == comment.commentNo}">
			            		<div class="printReReplyRight">	
			            			<div class="printReReply"> 	                
					                    <div class="writerRe">${reReply.userNickname }</div>
					                    <div class="commentedDiv">${reReply.content }</div>
					                    <div class="commentedTimeDiv"><fmt:formatDate pattern="yy.MM.dd hh:MM" value="${reReply.writeDate }"/></div>
					                    <c:if test="${loginUser.userNo == reReply.userNo}"> 
					                    	<div class="modifyDeleteDiv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정 삭제</div>   
					                    </c:if>	
					                    <c:if test="${loginUser.userNo != reReply.userNo}"> 
					                    	<div class="modifyDeleteDiv">
					                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신고
					                    	</div>   
					                    </c:if>	  
					                </div>   
					            </div>     
		              		</c:if>
             		 	</c:forEach>
              		</c:if>
                </c:forEach>
              	
                
                
          <!--로그인유저의 최초 댓글달 영역-->
	            <c:if test="${loginUser ne null }">
	          		<form action="/tour/replyUp" method="post" id="replyUp">
	                	<div class="writeReply"> 
	                    	<input type="hidden" name="userNo" value="${loginUser.userNo }">
	                    	<input type="hidden" name="tourNo" value="${tour.tourNo }">
	                    	<input type="hidden" name="userNickname" value="${loginUser.userNickname }">
	                    	
	                        <div class="writerRe">${loginUser.userNickname}</div>
	                        <div class="commentDiv"><input type="text" name="content"></div>
	                        <div class="writeButton">
	                            <button class="replyBtn">댓글쓰기</button>
	                        </div>
	                	</div>
	            	</form>
	            </c:if>	
            </div>	
        </main>    
                
        
        <script>
        
       //로그인 안돼있는데 결제버튼 누르면 로그인페이지로 이동
        function payButtonClicked() {
          if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
            location.href = '/user/login';
          } else {
            // 아무 작업도 하지 않고 그대로 머무릅니다.
          }
        }
        
        
        //삭제하기 버튼 눌렀을때 확인 거치기
        	function removeCheck(tourNo){
        		if(confirm("정말 삭제하시겠어요?")){
        			location.href="/tour/deletePosting?tourNo="+tourNo;
        		}
        	}
        
        
        	//대댓글 온클릭!
			function writeReply(writeArea){
				var replyDiv = writeArea.parentNode.parentNode;
				var reReplyDiv = document.querySelector(".writeReReply");
				var reReplyDivSibling = replyDiv.nextSibling;
	
				if(reReplyDivSibling == reReplyDiv){
					reReplyDiv.style.display="none";
					replyDiv.before(reReplyDiv);
				}else{
					replyDiv.after(reReplyDiv);
					reReplyDiv.style.display="flex";
				}
				
			}
        	
        	//대댓글 보이기
        	
	        
        </script>
        
        
        
        
            
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	    
	    
	   
	</body>
</html>