<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
		<link rel="stylesheet" href="../../../resources/css/freeboardNav.css">
	</head>
	<body>
		<table id="freeboardNav">
			<tr>
				<td><span>|</span> 자유게시판</td>
				<td>
					<a href="/freeboard/list">전체보기</a> | 
					<a href="/freeboard/list?searchCondition=question">질문</a> | 
					<a href="/freeboard/list?searchCondition=free">잡담</a>
				</td>
				<td></td>
				<td>
					<c:if test="${loginUser.userNo != null }">
			        	<button onclick="location.href='/freeboard/write'">새글쓰기</button>
		            </c:if>
		            <c:if test="${loginUser.userNo == null }">
		            	<button onclick="alert('로그인이 필요합니다.')">새글쓰기</button>
		            </c:if>
				</td>
			</tr>
		</table>
	</body>
</html>