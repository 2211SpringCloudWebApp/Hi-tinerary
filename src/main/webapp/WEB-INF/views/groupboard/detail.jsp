<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시글 상세</title>
		<link rel="stylesheet" href="../../../../resources/css/groupboarddetail.css">
	</head>
	<body>
		<div id="container-detail">
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<div id="board-area">
				<h1>${gBoard.groupName } 그룹 게시판</h1>
				<form action="/group/board/write" method="post">
					<label class="title-area">
						<p class="title-plain">제목 : </p><input type="text" name="groupTitle" class="board-title" value="${gBoard.boardTitle }" readonly>
					</label>
					<textarea name="groupSubject" rows="40" cols="150" readonly>${gBoard.boardSubject }</textarea>
				</form>
			</div>
			<div id="remark-area">
				<c:forEach items="${cInfo.cNumber }" var="cNum">
					<c:forEach items="${cInfo.cMap.get(cNum) }" var="comment">
						<c:if test="${comment.depth == 0 }">
							<div class="comment-area">
								<div class="comment-userNickName userNickName">${comment.userNickname }</div>
								<div class="comment-content content">${comment.content }</div>
								<div class="comment-writeDate writeDate"><fmt:formatDate value="${comment.updateDate }" pattern="yyyy-MM-dd ahh:mm" /></div>
								<div class="replyWrite"><button onclick="writereply(this)">대댓글달기</button><input type="hidden" value="${comment.commentNo }">
								</div>
								<div class="comment-modArea modArea">
									<c:if test="${loginUser.userNo eq comment.userNo }">
										<form action="/group/board/comment/delete" method="post">
											<input type="hidden" value="${comment.commentNo }" name="commentNo">
											<input type="hidden" value="${gBoard.boardNo}" name="groupBoardNo">
											<input type="hidden" value="${groupIndex}" name="groupIndex">
											<input type="submit" value="삭제">
										</form>
									</c:if>
								</div>
							</div>
						</c:if>
						<c:if test="${comment.depth == 1 }">
							<div class="reply-area">
								<div class="reply-userNickName userNickName">${comment.userNickname }</div>
								<div class="reply-content content">${comment.content }</div>
								<div class="reply-writeDate writeDate"><fmt:formatDate value="${comment.updateDate }" pattern="yyyy-MM-dd ahh:mm" /></div>
								<div class="reply-modArea modArea">
									<c:if test="${loginUser.userNo eq comment.userNo }">
										<form action="/group/board/comment/delete" method="post">
											<input type="hidden" value="${comment.commentNo }" name="commentNo">
											<input type="hidden" value="${gBoard.boardNo}" name="groupBoardNo">
											<input type="hidden" value="${groupIndex}" name="groupIndex">
											<input type="submit" value="삭제">
										</form>
									</c:if>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
				<div id="comment-Write">
					<form action="/group/board/comment/write" method="post">
						<input type="text" value="${loginUser.userNickname }"readonly>
						<input type="text" name="content">
						<input type="hidden" value="${loginUser.userNo}" name="userNo">
						<input type="hidden" value="${gBoard.boardNo}" name="groupBoardNo">
						<input type="hidden" value="${groupIndex}" name="groupIndex">
						<input type="submit" value="댓글쓰기">
					</form>
				</div>
			</div>
			<div id="for-list">
				<a href="/group/groupinfopage?groupIndex=${groupIndex }">목록으로</a>
				<form action="/group/board/updateView" method="post" onsubmit="return BoardBtn('${gBoard.userNo}')">
					<input type="hidden" name="groupName" value="${group.groupName }">
					<input type="hidden" name="groupBoardNo" value="${gBoard.boardNo}">
					<input type="hidden" name="groupIndex" value="${groupIndex }">
					<input type="submit" value="수정">
				</form>
				<form action="/group/board/delete" method="post" onsubmit="return BoardBtn('${gBoard.userNo}')">
					<input type="hidden" name="groupIndex" value="${groupIndex }">
					<input type="hidden" name="groupBoardNo" value="${gBoard.boardNo}">
					<input type="submit" value="삭제" >
				</form>
			</div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div>
	<script>
		function writereply(writeArea){
			var replyarea = document.querySelector("#write-reply")
			commentNoValue = writeArea.nextSibling.value;
			if(replyarea == null){
				addReplyArea(writeArea)				
			}else{
				if(replyarea != (writeArea.parentNode.parentNode.nextSibling)){
					addReplyArea(writeArea)									
				}
				replyarea.remove();
			}
		}
		
		function addReplyArea(writeArea){
			var userNo = document.createElement("input");
			userNo.setAttribute("type", "hidden");
			var groupIndex = userNo.cloneNode();
			var boardNo = userNo.cloneNode();
			var commentNo = userNo.cloneNode();
			groupIndex.setAttribute("value", "${groupIndex }");
			userNo.setAttribute("value", "${loginUser.userNo}");
			boardNo.setAttribute("value", "${gBoard.boardNo}")
			commentNo.setAttribute("value", commentNoValue);
			var writer = document.createElement("input");
			writer.setAttribute("readonly", true);
			writer.setAttribute("value", "${loginUser.userNickname}")
			var content = document.createElement("input");
			content.setAttribute("type","text")
			var submit = document.createElement("input");
			submit.setAttribute("type", "submit");
			submit.setAttribute("value", "대댓글쓰기");
			var form = document.createElement("form");
			form.setAttribute("action", "/group/board/reply/write");
			form.setAttribute("method", "post");
			content.setAttribute("name", "content");
			userNo.setAttribute("name", "userNo");
			boardNo.setAttribute("name", "groupBoardNo");
			commentNo.setAttribute("name", "refCommentNo")
			groupIndex.setAttribute("name", "groupIndex");
			form.append(writer);
			form.append(content);
			form.append(userNo);
			form.append(boardNo);
			form.append(commentNo);
			form.append(groupIndex);
			form.append(submit);
			var writePlace = document.createElement("div");
			writePlace.setAttribute("id", "write-reply")
			writeArea.parentNode.parentNode.after(writePlace);
			writePlace.append(form);
		}
		
		function BoardBtn(writer){
			if(writer == ${loginUser.userNo}){
				return true;
			}else{
				alert('권한없음');
				return false;
			}
		}
	</script>
	</body>
</html>