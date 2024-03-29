<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시판 목록</title>
<link rel="stylesheet" href="../../../resources/css/withBoardList.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	 <main id="withBoardList">
        <div id="withTitle">
            <div id="bar_title"></div>
            <p>커뮤니티</p>
        </div>
		<div id="withSubTitle">
			<div id="bar_subtitle"></div>
			<p>동행찾기</p>
			<c:if test="${loginUser eq null }">
				<button onclick="noWrite()">글쓰기</button>
			</c:if>
			<c:if test="${loginUser ne null }">
				<button onclick="location.href='/withboard/withWriteView'">글쓰기</button>
			</c:if>
		</div>
		
	<div class="list_wrapper">
	<ul>
	<c:forEach items="${wList }" var="withBoard">
    <c:set var="now" value="<%= new java.util.Date() %>" />
    <li class="${withBoard.endDate.getTime() < now.getTime() ? 'expired' : ''}">
        <div class="img">
            <a href="/withboard/withBoardDetail?boardNo=${withBoard.boardNo }">
                <img src="../../../${withBoard.boardImage }">
            </a>
        </div>
        <strong class="tit">${withBoard.boardTitle }</strong>
        <div class="withDate"> 
        <span class="date"> 
            <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~ 
            <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" />
        </span>
        </div>
        
        <div class="withWrite">
        <span class="writer">${withBoard.userNickname}</span> 
        </div>
        <div class="withPeople">
        <span class="people">${withBoard.currentPeople } / ${withBoard.maxPeople }</span>
        </div>
    </li>
</c:forEach>
</ul>
</div>

	<table id="pagefooter">
		<tr>
			<td colspan="5" id="board-navi">
			<input id="page" type="hidden" value="${pi.currentPage }">
				<c:if test="${pi.currentPage ne '1' }">
					<a href="/withboard/withBoardList?page=${pi.currentPage - 1}">&lt;</a>&nbsp;
				</c:if> 
				<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
					<a href="/withboard/withBoardList?page=${p}" class="pageNavi">${p}</a>&nbsp;
				</c:forEach> 
				<c:if test="${pi.currentPage ne pi.maxNavi }">
					<a href="/withboard/withBoardList?page=${pi.currentPage + 1}">&gt;</a>&nbsp;
				</c:if> 
			</td>
		</tr>
	</table>

	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		function noWrite() {
			if (confirm("로그인 후 이용해주세요")) {
				location.href = "/user/login";
			}
		}
		
		// 페이징 디자인
		var page = document.querySelector("#page").value
            var pageNavi = document.querySelectorAll(".pageNavi")
            
            for(let i = 0; i < pageNavi.length; i++) {
                if (pageNavi[i].innerHTML == page) {
                	pageNavi[i].style.fontSize = '40px';
                	pageNavi[i].style.color = '#0F8D80';
                }
            }
	</script>
	</body>
	</html>