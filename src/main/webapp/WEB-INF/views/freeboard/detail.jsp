<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>자유게시판 상세조회</title>
	<link rel="stylesheet" href="../../../resources/css/freeboardDetail.css">
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
                        <td>${loginUser.userNickname }</td>
                        <td>
                        	<c:if test="${freeboard.boardHead == 'question'}">
                        		<c:if test="${freeboard.boardCheck == 0}">
                        			<div id = "detailDiv1">답변대기</div>
                        		</c:if>
                        		
                        		<c:if test="${freeboard.boardCheck == 1}">
                        			<div id = "detailDiv2">답변완료</div>
                        		</c:if>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <table id="detailTable2">
                    <tr>
                        <td></td>
                        <td>
                        	${freeboard.writeDate }
                        	<c:if test="${freeboard.userNo == loginUser.userNo}">
        	                	<a href="#">수정</a> | 
    	                    	<a href="/freeboard/remove?boardNo=${freeboard.boardNo }" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                        	</c:if>
                        	<c:if test="${freeboard.userNo != loginUser.userNo}">
	                        	 | <a id="accusation" href="#">신고</a>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <table id="detailTable3">
                    <tr>
                    	<td>
	                    	<textarea id="textArea" readonly>${freeboard.boardSubject }
	                    		<c:if test="${freeboard.boardImage != null}">
	                       		</c:if>
	                    	</textarea>
                    	</td>
                    </tr>
                </table>
            </div>
        </main>
        
        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </footer>
	</body>
</html>