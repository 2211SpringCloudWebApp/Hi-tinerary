<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 수정</title>
		<link rel="stylesheet" href="../../../resources/css/freeboardWrite.css">
		<style>
            #freeboardDiv{
                width: 1200px;
            }
        </style>
	</head>
	<div id="write-content">
		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<!-- 메인 -->
		<main>
			<div id="write-content">
            	<jsp:include page="/WEB-INF/views/freeboard/freeboardNav.jsp"></jsp:include>
	            <form action="/freeboard/modify" method="POST" enctype="multipart/form-data">
                	<table id="writeTable1">
	                    <tr>
	                        <td>
	                        	<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
                        		<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
	                        </td>
	                        <td>
	                        	<input id="inputtitle" name="boardTitle" type="text" value="${freeboard.boardTitle }"> 
	                      		<input name="userNo" type="text" value="${loginUser.userNo }" style="display:none">
								<input name="boardNo" type="text" value="${freeboard.boardNo }" style="display:none">
	                        </td>
	                        <td><span name="nickname">${loginUser.userNickname }</span></td>
	                        <td>
	                        </td>
	                    </tr>
	                </table>
	                <table id="writeTable2">
	                    <tr>
	                    	<td>
		                    	<textarea name="boardSubject" id="textArea">${freeboard.boardSubject }</textarea>
	                    	</td>
	                    </tr>
	                </table>
	                <table id="writeTable3">
	                	<tr>
			                <td>본문이미지첨부</td>
			                <td>placeholder | jpg,png 파일만 가능</td>
			                <td>
			                	<input name="reloadFile" type="file" id="fileInput" style="display: none;">
								<button onclick="document.getElementById('fileInput').click(); return false;">첨부하기</button>
			                </td>
			            </tr>
	                </table>
	                <table id="writeTable4">
	                	<tr>
	                		<td>
	                			<input id="uplodebutton" type="submit" value="수정하기">
								<input id="viewlistbutton"type="button" value="목록보기" onclick="location.href='/freeboard/list'">
	                		</td>
	                	</tr>
	                </table>
	        	</form>
  		    </div>
        </main>
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</div>
</html>