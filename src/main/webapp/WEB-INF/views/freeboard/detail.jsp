<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 상세조회</title>
		<link rel="stylesheet" href="../../../resources/css/freeboardDetail.css">
		<link rel="stylesheet" href="../../../resources/css/freeboardComment.css">
	</head>
	<body>
		<!-- 헤더 -->
		<header>
            <jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
        </header>
        
        <!-- 메인 -->
        <main>
            <div id="detail-content">
            	<jsp:include page="/WEB-INF/views/freeboard/freeboardNav.jsp"></jsp:include>
                <table id="detailTable1">
                    <tr>
                        <td>
                        	<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
                        	<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
                        </td>
                        <td>${freeboard.boardTitle }</td>
                        <td>${freeboard.userNickname }</td>
                        <td>
                        	<c:if test="${freeboard.boardHead == 'question'}">
                        		<c:if test="${freeboard.boardCheck == 0}">
                        			<div class="detailDiv" id = "detailDiv1">답변대기</div>
                        		</c:if>
                        		
                        		<c:if test="${freeboard.boardCheck == 1}">
                        			<div class="detailDiv" id = "detailDiv2">답변완료</div>
                        		</c:if>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <table id="detailTable2">
                    <tr>
                        <td></td>
                        <td>
                        	${fn:substring(freeboard.writeDate, 0, 10)} 오전 ${fn:substring(freeboard.writeDate, 11, 13)}시
                        	<c:if test="${loginUser.userNo != null }">
	                        	<c:if test="${freeboard.userNo == loginUser.userNo}">
	                        		<a href="/freeboard/modify?boardNo=${freeboard.boardNo}">수정</a> | 
	                        	</c:if>
	                        	<c:if test="${freeboard.userNo == loginUser.userNo || loginUser.userGrade == 4}">
	    	                    	<a href="/freeboard/remove?boardNo=${freeboard.boardNo }" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
	                        	</c:if>
	                        	<c:if test="${freeboard.userNo != loginUser.userNo && loginUser.userGrade != 4}">
		                        	 | <a id="accusation" href="/report">신고</a>
	                        	</c:if>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <!-- 이미지와 텍스트공간 영역 -->
                <table id="detailTable3">
                    <tr>
                    	<td>
                    		<img src="${freeboard.boardImage != null ? freeboard.boardImage.replace('C:\\Users\\user1\\git\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
	                    	<textarea id="textArea" readonly>${freeboard.boardSubject }
	                    		<c:if test="${freeboard.boardImage != null}">
	                       		</c:if>
	                    	</textarea>
                    	</td>
                    </tr>
                </table>
                <!-- 댓글 작성 하는 영역 -->
			    <c:if test="${loginUser.userNo != null }">
	                <div id="comment_container">
			            <table id="comment_table">
			                <tr>
			                    <td id="comment_td1">${loginUser.userNickname}</td>
			                    <td id="comment_td2"><input name="content" id="comment_input" type="text" placeholder="여기에 댓글을 작성해 주세요."></td></td>
			                    <td id="comment_td3"><button id="comment_button" onclick="location.href='/freeboard/comment/write'">댓글달기</button></td>
			                </tr>
			            </table>
			        </div>
			    </c:if>
            </div>
        </main>
        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </footer>
	</body>
</html>