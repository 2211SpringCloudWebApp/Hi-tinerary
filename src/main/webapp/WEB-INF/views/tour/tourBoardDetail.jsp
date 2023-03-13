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

<!-- 													${tour } -->
                
            <div id="thumbnailAndInfos">
                <div id="thumbnail">
<!--                     520px x 520px <br> thumbnail -->
					<img src="${tour.thumbnail != null ? tour.thumbnail.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noThumbnail.png'}">
                </div>
                <div id="tourInfos">
                    <div id="writerDiv">
                        <div>한투어</div>
                        <div>
                        	<a href="/notice/modifyView?tourNo=${tour.tourNo }">수정</a> | 
                        	<a href="javascript:void(0);" onclick="removeCheck(${tour.tourNo});">삭제</a>
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
                        <div><button id="pay">결제하기</button></div>
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
            <div id="partition1">
                상세일정 안내
            </div>
            <div id="tourContent">
                 ${tour.tourContent } <br>
                  <img src="${tour.tourImage != null ? tour.tourImage.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : ' '}">
            </div>
            <div id="replyDiv">
               댓글영역 ~두둥~ 댓글영역
            </div>
        </main>    
                
        
        <script>
        	function removeCheck(tourNo){
        		if(confirm("정말 삭제하시겠어요?")){
        			location.href="/tour/deletePosting?tourNo="+tourNo;
        		}
        	}
        </script>
        
            
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>  
	    
	    
	   
	</body>
</html>