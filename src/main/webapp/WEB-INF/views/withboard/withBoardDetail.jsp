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
					<div id="report">
						<button id="listBtn" onclick="location.href='/withboard/withBoardList'">목록으로</button>
						<c:if test="${loginUser ne null }">
						<form action="/report" method="POST">
							<input type="hidden" name="userNo" value="${loginUser.userNo}">
							<input type="hidden" name="boardNo" value="${withBoard.boardNo}">
							<input type="hidden" name="boardTitle" value="${withBoard.boardTitle}">
							<input type="hidden" name="userNickname" value="${withBoard.userNickname}">
							<input type="hidden" name="commentNo" value=0>
							<input type="hidden" name="boardType" value="with">
							<button type="submit" id="singo" onclick="event.preventDefault(); document.querySelector('form').submit();">신고하기</button>
						</form>
						</c:if>
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
					<span id="writeDate"><fmt:formatDate value="${withBoard.writeDate }" pattern="yyyy-MM-dd ahh:mm" /></span>
				</div>
				<div id="writeContent">${withBoard.boardContent }</div>
				<c:if test="${loginUser.userNo == withBoard.userNo}">
					<div id="modifyBtn">
						<button class="modify" onclick="location.href='/withboard/withModifyView?boardNo=${withBoard.boardNo }'">수정하기</button>
						<button class="delete" onclick="removeCheck('${withBoard.boardNo}');">삭제하기</button>
					</div>
				</c:if>
			</div>
		</div>
	<!-- 댓글영역 -->
	<!-- 댓글 리스트 나오는 영역 -->
	<div class="comment-container"> 
		<div class="comment-listbox">
		<c:forEach items="${cList }" var="comment">
			<c:if test="${comment.depth == 0 }">
			<div class="commentbox">
				<div class="commentNo">${comment.commentNo }</div>
				<p class="comment-nickname">${comment.userNickname }</p>
				<p class="comment-content">${comment.content }</p>
				<p class="comment-date"><fmt:formatDate value="${comment.writeDate }" pattern="yyyy-MM-dd ahh:mm" /></p>
				<c:if test="${comment.status == 0 && loginUser.userNo != comment.userNo && withBoard.userNo == loginUser.userNo }">
				<button class="comment_button" id="popup_open_btn" onclick="inviteBtn(this)">초대</button>
				</c:if>
				<c:if test="${loginUser.userNo ne null }">
					<div class="comment-others">
						<a href="" id="replycommentBtn" onclick="replywriteform(this)">댓글달기</a>
						<form action="/report" method="POST">
							<input type="hidden" name="userNo" value="${loginUser.userNo}">
							<input type="hidden" name="boardNo" value="${withBoard.boardNo}">
							<input type="hidden" name="boardTitle" value="${withBoard.boardTitle}">
							<input type="hidden" name="userNickname" value="${withBoard.userNickname}">
							<input type="hidden" name="commentNo" value="${comment.commentNo }">
							<input type="hidden" name="boardType" value="with">
							<a href="#" onclick="event.preventDefault(); document.querySelector('form').submit();">신고</a>
						</form>
					<c:if test="${loginUser.userNo == comment.userNo}">
						<a href="javascript:void(0);" onclick="replyRemoveCheck(${comment.commentNo});">삭제</a>
					</c:if>
					</div>
					</c:if>
				<div class="commentNo">${comment.userNo }</div>
			</div>
			</c:if>
			<!-- 대댓글이 나오는 영역 -->
			<c:if test="${comment.depth == 1 }">
			<div class="replybox">
				<p class="reply-nickname">${comment.userNickname }</p>
				<p class="reply-content">${comment.content }</p>
				<p class="reply-date"><fmt:formatDate value="${comment.writeDate }" pattern="yyyy-MM-dd ahh:mm" /></p>
				<c:if test="${loginUser.userNo == comment.userNo}">
				<a href="javascript:void(0);" onclick="replyRemoveCheck(${comment.commentNo});">삭제</a>
				</c:if>
			</div>
			</c:if>
		</c:forEach>
			<!-- 대댓글을 눌렀을 때 나오는 폼 -->
			<div class="replywritebox" id="replywrite">
				<p class="replywrite-nickname">${loginUser.userNickname }</p>
				<form action="/withboard/board/reply/write" method="post">
					<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
					<input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">
					<input type="hidden" name="RefcommentNo" id="refvalue">
					<input type="text" class="replywrite-content" name="replycontent">
					<button class="replywritebtn">대댓글쓰기</button>
				</form>
			</div>
		</div>
		
		<!-- 댓글 처음 작성하는 부분 -->
		<c:if test="${loginUser ne null }">
		<div class="comment-writebox">
			<p class="commentwrite-nickname">${loginUser.userNickname }</p>
				<form action="/withboard/board/comment/write" method="post">
					<input type="hidden" name="CommentBoardNo" value="${withBoard.boardNo }">
					<input type="hidden" name="CommentUserNo" value="${loginUser.userNo }">
					<input type="text" name="Commentcontent" class="commentwrite-content">
					<button class="commentwritebtn">댓글쓰기</button>
				</form>
		</div>
		</c:if>
	</div>
	<!-- 초대 버튼 눌렀을 때 모달창 띄우기 -->
	<div id="modal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <p>초대할 그룹을 선택하세요</p>
	    <form action="/group/invite" method="POST">
	    	<input type="hidden" name="userNo" id="userNo">
	    	<input type="hidden" name="boardNo" value="${withBoard.boardNo }">
	    	<select name="groupNo">
	    	<c:forEach items="${gList }" var="group">
	    	<!-- <option disabled selected>그룹을 선택해주세요</option> -->
	    	<option value="">그룹을 선택해주세요</option>
	    	<option value="${group.groupNo }">${group.groupName }</option>
	    	</c:forEach>
	    	</select>
	    	<input type="submit" value="초대하기">
	    </form>
	  </div>
	</div>

	<c:if test="${comment.status == 0 && loginUser.userNo != comment.userNo && withBoard.userNo == loginUser.userNo }">
		<button class="lcomment_button2" id="popup_open_btn" onclick="inviteBtn()">초대</button>
	</c:if>
	</main>

	<!-- footer -->
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
	if(btn != null){
	btn.addEventListener('click', function(e){
		e.preventDefault();
		var mainComment = this.parentNode.parentNode.parentNode;
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
		
	}
	
	
	// 모달 창을 나타내는 함수
	function showModal() {
	  var modal = document.getElementById("modal");
	  modal.style.display = "block";
	}

	// 모달 창을 닫는 함수
	function hideModal() {
	  var modal = document.getElementById("modal");
	  modal.style.display = "none";
	}

	// 초대 버튼 클릭 시 모달 창 나타내기
	function inviteBtn(inviteBtn) {
	  showModal();
	  document.querySelector("#userNo").value=inviteBtn.parentNode.lastElementChild.innerHTML;
	}

	// 모달 창 외의 영역 클릭 시 모달 창 닫기
	var modal = document.getElementById("modal");
	window.onclick = function(event) {
	  if (event.target == modal) {
	    hideModal();
	  }
	}

	// 모달 창 닫기 버튼 클릭 시 모달 창 닫기
	var closeBtn = document.getElementsByClassName("close")[0];
	closeBtn.onclick = function() {
	  hideModal();
	}
	

	// 대댓글 나오게 하는 스크립트
	 function replywriteform(writeBtn){
		var e = window.event;
		e.preventDefault();
		var replywritebox = document.querySelector("#replywrite")
		var commentbox = writeBtn.parentNode.parentNode;
		if(commentbox.nextSibling == replywritebox){
			replywritebox.style.display = "none";
			commentbox.before(replywritebox);
		} else{
			replywritebox.style.display = "flex";
			commentbox.after(replywritebox);
			document.querySelector("#refvalue").value = commentbox.firstElementChild.innerHTML;
		}
	}
	
	//댓글 삭제하기
	function replyRemoveCheck(commentNo){
		if(confirm("정말 삭제 하시겠어요?")){
			location.href="/withboard/board/comment/delete?commentNo="+commentNo + "&boardNo=${withBoard.boardNo}";
		}
	}

	</script>
</body>

</html>