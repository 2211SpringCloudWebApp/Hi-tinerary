<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>동행찾기 게시판 상세페이지</title>
<link rel="stylesheet" href="../../../resources/css/withBoardDetail.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
	<%-- <h1>커뮤니티/동행찾기</h1>
               <img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}"><br>
                제목 : ${withBoard.boardTitle }<br>
                <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~
                <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" /><br>
                현재인원수 / 최대 인원수: ${withBoard.currentPeople } / ${withBoard.maxPeople }<br>
                작성자 : ${withBoard.userNo }<br>
                작성날짜 : ${withBoard.writeDate }<br>
                내용 : ${withBoard.boardContent } <br> --%>
                
	<main id="withBoardDetail">
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

		<div id="thumbnailAndInfos">
			<div id="thumbnail">
				<img src="${withBoard.boardImage != null ? withBoard.boardImage.replace('C:\\Users\\samsung\\eclipse-workspace\\Hi-tinerary\\src\\main\\webapp\\resources', '\\resources') : '/resources/images/noboardImage.png'}">
			</div>
			제목 : ${withBoard.boardTitle }<br>
			 <fmt:formatDate value="${withBoard.startDate }" pattern="yyyy-MM-dd" /> ~
                <fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" /><br>
                현재인원수 / 최대 인원수: ${withBoard.currentPeople } / ${withBoard.maxPeople }<br>
                작성자 : ${withBoard.userNickname }(${withBoard.userGender } / 
                <c:if test="${withBoard.userBirthDate < 0 }">
    			${100 + withBoard.userBirthDate }
    			</c:if>
    			 <c:if test="${withBoard.userBirthDate > 0 }">
    			${withBoard.userBirthDate }
    			</c:if>
                )<br>
                작성날짜 : ${withBoard.writeDate }<br>
			<div id="content">
				<div id="writeContent">${withBoard.boardContent }</div>
			</div>
		</div>
		<c:if test="${loginUser.userNo == withBoard.userNo}">
			<a href="/withboard/withModifyView?boardNo=${withBoard.boardNo }">수정</a>
			<a href="javascript:void(0);" onclick="removeCheck(${withBoard.boardNo });">삭제</a> 
		</c:if>
		<a href="/withboard/withBoardList">목록</a>
		<hr>
		
		<c:if test="${loginUser ne null }">
		<div id="comment_container">
			<form action="/withboard/board/comment/write" method="POST">
				<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
				<table id="comment_table">
					<tr>
						<td id="comment_td1"><input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">${loginUser.userNickname }</td>
						<td id="comment_td2"><input id="comment_input" name="Commentcontent" type="text" placeholder="여기에 댓글을 작성해 주세요."></td>
						<td id="comment_td3"><button id="comment_button">댓글달기</button></td>
					</tr>
				</table>
			</form>
		</div>
			</c:if>
			
			<div id="reply_container">
			<form action="/withboard/board/comment/write" method="POST">
				<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
				<table id="comment_table">
					<tr>
						<td id="comment_td1"><input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">${loginUser.userNickname }</td>
						<td id="comment_td2"><input id="comment_input" name="Commentcontent" type="text" placeholder="여기에 댓글을 작성해 주세요."></td>
						<td id="comment_td3"><button id="comment_button">댓글달기</button></td>
					</tr>
				</table>
			</form>
		</div>
		
		<div id="lcomment_container">
                <table id="lcomment_table">
                <c:forEach items="${ cList}" var="comment">
                    <tr>
                        <td class="lcomment_td1">${comment.userNo }</td>
                        <td class="lcomment_td2"><input class="lcomment_input" type="text" readonly value="${comment.content }"></td>
                        <td class="lcomment_td3">[${comment.writeDate }]</td>
                        <td class="lcomment_td4">
                        <c:if test="${comment.status == 0 && loginUser.userNo != comment.userNo && withBoard.userNo == loginUser.userNo }">
                        <button class="lcomment_button2">초대</button>
                        </c:if>
                        </td>
                        <td class="lcomment_td5">
                            <a href="#">댓글달기</a>
                            <c:if test="${loginUser.userNo == comment.userNo || loginUser.userGrade == 4}">
                            <form action="/withboard/board/comment/delete" method="POST">
                            <input type="hidden" value="${withBoard.boardNo }" name="boardNo">
                            <input type="hidden" value="${comment.commentNo }" name="commentNo">
                            | <input type="submit" value="삭제">
                            </form>
                            </c:if>
                            | <a href="#">신고</a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
           
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
	//로그인이 안된채로 글 등록을 하려고 할 때 로그인 페이지로 이동
	function noWrite(){
		if(confirm("로그인 후 이용해주세요")){
			location.href="/user/login";
		}
	}
	
	//삭제하기 버튼을 눌렀을 때
	 function removeCheck(boardNo){
		if(confirm("정말 삭제하시겠어요?")){
			location.href="/withboard/deletePosting?boardNo="+boardNo;
		}
	}
	
	// 대댓글 달기 버튼 눌렀을 때
	var btn = document.querySelector(".lcomment_td5 a:nth-of-type(1)");
	btn.addEventListener('click', function(e){
		e.preventDefault();
		var mainComment = this.parentNode.parentNode;
		console.log(mainComment);
		var nextNode = mainComment.nextSibling; 
		var replyInput = document.querySelector("#reply_container");
		if(nextNode == replyInput){
			replyInput.style.display = "none";
			btn.before(replyInput);
		} else{
		mainComment.after(replyInput);
		replyInput.style.display = "flex";
		}
		
	});
	</script>
</body>

</html>