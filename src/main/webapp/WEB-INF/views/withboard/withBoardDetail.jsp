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

		<!-- 썸네일 이미지 -->
		<div id="thumbnailAndInfos">
			<div id="thumbnail">
				<div id="thumbnailImage">
					<img src="../../../${withBoard.boardImage }">
					<div id="title">${withBoard.boardTitle }</div>
					<div id="date">
						<fmt:formatDate value="${withBoard.startDate }"
							pattern="yyyy-MM-dd" />
						~
						<fmt:formatDate value="${withBoard.endDate }" pattern="yyyy-MM-dd" />
					</div>
					<div id="People">${withBoard.currentPeople } /
						${withBoard.maxPeople }</div>
				</div>
			</div>

			<div id="mainContent">
				<div id="nickname">
					${withBoard.userNickname }(${withBoard.userGender } /
					<c:if test="${withBoard.userBirthDate < 0 }">
									${100 + withBoard.userBirthDate }
								</c:if>
					<c:if test="${withBoard.userBirthDate > 0 }">
									${withBoard.userBirthDate }
								</c:if>
					)
					<fmt:formatDate value="${withBoard.writeDate }" pattern="yyyy-MM-dd ahh:mm" />
				</div>
				<div id="writeContent">${withBoard.boardContent }</div>
				<c:if test="${loginUser.userNo == withBoard.userNo}">
					<div id="modifyBtn">
						<button class="modify" onclick="location.href='/withboard/withModifyView?boardNo=${withBoard.boardNo }'">수정하기</button>
						<button class="delete" onclick="removeCheck(${withBoard.boardNo });">삭제하기</button>
						<!-- <button id="list" onclick="location.href='/withboard/withBoardList'">목록으로</button> -->
					</div>
				</c:if>
			</div>
		</div>

<!-- 댓글영역 -->
<!-- 댓글이 출력되는 영역  -->
<div id="lcomment_container">
<table id="lcomment_table">
<c:forEach items="${ cList}" var="comment">
<tr>
<td class="lcomment_td1">${comment.userNo }</td>
<td class="lcomment_td2">
<input class="lcomment_input" type="text" readonly value="${comment.content }">
</td>
<td class="lcomment_td3">
[<fmt:formatDate value="${withBoard.writeDate }" pattern="yyyy-MM-dd ahh:mm" />]
</td>
<td class="lcomment_td4">
<form action="" method="">
<%-- <c:if test="${comment.status == 0 && loginUser.userNo != comment.userNo && withBoard.userNo == loginUser.userNo }"> --%>
<button class="lcomment_button2">초대</button>
<%-- </c:if> --%>
</form>
</td>
<td class="lcomment_td5">
<c:if test="${loginUser.userNo == comment.userNo || loginUser.userGrade == 4}">
<form action="/withboard/board/comment/delete" method="POST">
<input type="hidden" value="${withBoard.boardNo }" name="boardNo">
<input type="hidden" value="${comment.commentNo }" name="commentNo">
<a href="#">대댓글</a>
| <a href="#">신고</a>
| <input type="submit" value="삭제">
</form>
</c:if>
</td>
</tr>
</c:forEach>
</table>
</div>





            
<!-- 댓글을 달고 대댓글을 눌렀을 때 뜨는 것 -->
<div id="reply_container">
<form action="/withboard/board/comment/write" method="POST">
<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
<table id="replycomment_table">
<tr>
<td id="replycomment_td1">
<input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">
${loginUser.userNickname }
</td>
<td id="replycomment_td2">
<input id="replycomment_input" name="Commentcontent" type="text" placeholder="여기에 댓글을 작성해 주세요.">
</td>
<td id="replycomment_td3">
<button id="replycomment_button">댓글달기</button>
</td>
</tr>
</table>
</form>
</div>

<!-- 처음 댓글 작성하는 영역 -->
<c:if test="${loginUser ne null }">
<div id="comment_container">
<form action="/withboard/board/comment/write" method="POST">
<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
<table id="withcomment_table">
<tr>
<td id="withcomment_td1">
<input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">
${loginUser.userNickname }
</td>
<td id="withcomment_td2">
<input id="withcomment_input" name="Commentcontent" type="text" placeholder="여기에 댓글을 작성해 주세요.">
</td>
<td id="withcomment_td3">
<button id="withcomment_button">댓글달기</button>
</td>
</tr>
</table>
</form>
</div>
</c:if>
           
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

</html>