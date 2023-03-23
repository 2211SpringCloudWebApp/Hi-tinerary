<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>투어상품결제페이지</title>
		 <link rel="stylesheet" href="${path }../../../resources/css/tourPayView.css"/>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<main id="tourBoardDetail">
	            <div id="boardTitle">
	                <div id="bar">  </div>
	                <p>투어 / 패키지 상품 결제</p>                    
	            </div>

 				<input type="hidden" name="payuserNo" value="${sessionScope.loginUser.userNo }">									
 									
 										
                
            <div id="thumbnailAndInfos">
                <div id="thumbnail">
<!--                     520px x 520px <br> thumbnail -->
					<img src="../../../../${tour.thumbnail}">
                </div>
                <div id="tourInfos">
                    <div id="writerDiv">
                        <div>한투어</div>
                    </div>
                    <div class="oneHundred"> 
                                <div class="infos">상품명</div>
                                <div><input type="text" name="tourTitle"  value="${tour.tourTitle }" readonly></div>
                            </div>	
                    <div class="oneHundred"> 
                        <div class="infos">모집마감</div>
                        <div><fmt:formatDate pattern="MM/dd" value="${tour.deadline }"/></div>
                    </div> 
                    <div class="oneHundred"> 
                        <div class="infos">여행기간</div>
                        <div><fmt:formatDate pattern="yy.MM.dd h시" value="${tour.startDate }"/></div>
                        ~&nbsp;
                        <div><fmt:formatDate pattern="yy.MM.dd h시" value="${tour.endDate }"/></div>
                    </div>	
                    <div class="oneHundred"> 
                        <div class="infos">총결제금액</div>
                        <div><fmt:formatNumber pattern="#,###,###" value="${tour.price }"/> 원</div>
                    </div>
                    <div class="oneHundred"> 
                        <div class="infos">예약자성함</div>
                        <div>
                        <input type="hidden" name="userNo">
                        <input type="text" name="userName" value="${user.userName}" readonly>
                        </div>
                    </div>
                    <div class="oneHundred"> 
                        <div class="infos">예약자연락처</div>
                        <div><input type="text" name="userPhone" value="${user.userPhone}" readonly></div>
                    </div>
                    <div class="oneHundred"> 
                        <div class="infos">예약자이메일</div>
                        <div><input type="text" name="userEmail" value="${user.userEmail}" readonly></div>
                    </div>
                    <form action="/tour/paid" method="post">
	                    <input type="hidden" name="tourNo" value="${tour.tourNo }">
	                    <input type="hidden" name="userNo" value="${user.userNo }">
	                    
		                <div id="half-button1">
		                    <button id="up" onclick="submitForm()">결제하기</button>
		                </div>
	                </form>
	                <div id="half-button2">  				
	                    <a href="/tour/tourBoardList"><button type="button" id="back" >페이지나가기</button></a>
	                </div>    
                </div>
            </div>
            
     
        </main>    
                
        <script>
	        function submitForm() {
	        	if (confirm("결제하시겠습니까?")) {
	                document.querySelector('form').submit();
	            }
	        }
        </script>
      
        
            
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	    
	    
	   
	</body>
</html>