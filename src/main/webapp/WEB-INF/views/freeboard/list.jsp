<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
		<style>
		
		</style>
	</head>
	<body>
		<h1>커뮤니티</h1>
		<span>자유게시판</span>
		<ul>
			<li>전체보기</li>
			<li>질문</li>
			<li>잡담</li>
		</ul>
		<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td style="text-align: center;">${i.count }</td>
						<td><a href="/notice/detail.kh?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
						<td>${notice.noticeWriter }</td>
						<td>${notice.nCreateDate }</td>
						<td style="text-align: center;">
							<c:if test="${!empty notice.noticeFilename }">O</c:if>
							<c:if test="${empty notice.noticeFilename  }">X</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>

			</tfoot>
		</table>
	</body>
</html>