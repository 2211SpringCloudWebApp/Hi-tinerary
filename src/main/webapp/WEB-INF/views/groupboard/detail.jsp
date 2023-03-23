<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시글 상세</title>
		<style>
			#container-detail{
				width : 1200px;
				margin : 0px auto;
			}
			#board-area{
				margin-bottom : 25px;
			}
			#remark-area{
				border-top : 1px dashed yellowgreen;
				padding-top : 25px;
			}
			.comment-area{
				margin : 10px auto;
				width : 1100px;
				height : 40px;
				display : flex;
				border : 1px solid darkgray;
				border-radius : 5px;
			}
				.userNickName{
					margin : auto 0px;
					margin-left : 20px;
					font-size : 20px;
					color : #FBD188;
					width : 150px;
					padding-right : 10px
				}
				.content{
					margin : auto 0px;
					margin-left : 25px; 
					width : 500px;
					font-size : 20px;
				}
				.writeDate{
					margin : auto 0px;
					width : 200px;
					text-align : center;
				}
				.replyWrite{
					width : 85px;
				}
					.replyWrite button{
						margin-top : 7px;
						text-align : center;
			        	color : white;
			        	background-color : #F39081;
			        	border : none;
			        	border-radius : 5px;
			        	padding : 3px 5px;
					}
				.modArea{
					width : 100px;
				}
			.reply-area{
				margin : 10px 0px;
				margin-left : 90px;
				width : 1060px;
				height : 40px;
				display : flex;
				border : 1px solid darkgray;
				border-radius : 5px;
			}
			#write-reply{
				width : 1060px;
				height : 50px;
				margin-left : 90px;
				margin-bottom : 20px;
				border : 1px solid darkgray;
				border-radius : 5px;
			}
			#write-reply form{
				margin-top : 7px;
			}
			#write-reply input:nth-of-type(1){
				border : 0px;
				width : 150px;
				border-right : 1px solid black;
				outline : none;
				margin-left : 20px;
				font-size : 20px;
				color : #FBD188;
			}
			#write-reply input:nth-of-type(2){
				margin-left : 25px;
				width : 670px;
				border : 0;
				outline : none;
				height : 30px;
				font-size : 20px;
			}
			#write-reply input:nth-of-type(7){
				text-align : center;
	        	color : white;
	        	background-color : #F39081;
	        	border : none;
	        	border-radius : 5px;
	        	padding : 6px 5px;
	        	margin-bottom : 3px
			}
			#comment-Write{
				border : 1px solid darkgray;
				width : 1100px;
				border-radius : 5px;
				margin : 0px auto;
			}
			#comment-Write form{
				margin-top : 7px;
			}
			#comment-Write input:nth-of-type(1){
				border : 0px;
				width : 150px;
				border-right : 1px solid black;
				outline : none;
				margin-left : 20px;
				font-size : 20px;
				color : #FBD188;
			}
			#comment-Write input:nth-of-type(2){
				margin-left : 25px;
				width : 700px;
				border : 0;
				outline : none;
				height : 30px;
				font-size : 20px;
			}
			#comment-Write input:nth-of-type(6){
				text-align : center;
	        	color : white;
	        	background-color : #F39081;
	        	border : none;
	        	border-radius : 5px;
	        	padding : 6px 5px;
	        	margin-bottom : 8px
			}
			.modArea{
				display : flex; 
			}
			.modArea input{
				text-align : center;
	        	color : white;
	        	background-color : #F39081;
	        	border : none;
	        	border-radius : 5px;
	        	padding : 3px 5px;
	        	margin : 0px 3px;
	        	margin-bottom : 3px;
	        	margin-top : 7px;
			}
			#for-list{
				text-align : center;
				margin-top : 30px;
				display : flex;
				justify-content : center;
			}
				#for-list a{
					text-decoration : none;
					color : white;
					background-color : #FBD188;
					padding : 5px 5px;
					border-radius : 5px;
					margin : 0px 5px
				}
				#for-list input{
					font-size : 15px;
					color : white;
					width : 60px;
					background-color : #FBD188;
					padding : 5px 0px;
					border : 0px;
					border-radius : 5px;
					margin : 0px 5px;
				}
		</style>
	</head>
	<body>
		<div id="container-detail">
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			<div id="board-area">
				<h1>${gBoard.groupName } 그룹 게시판</h1>
				<form action="/group/board/write" method="post">
					<input type="text" name="groupTitle" value="${gBoard.boardTitle }" readonly> <br>
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