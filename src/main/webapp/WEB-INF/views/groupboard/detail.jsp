<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 게시글 상세</title>
		<style>
			#board-area{
				margin-bottom : 25px;
			}
			#remark-area{
				border-top : 1px dashed yellowgreen;
				padding-top : 25px;
			}
			.comment-area{
				margin : 10px 0px;
				margin-left : 20px;
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
				margin-left : 50px;
				width : 1070px;
				height : 40px;
				display : flex;
				border : 1px solid darkgray;
				border-radius : 5px;
			}
			#write-reply{
				width : 1070px;
				height : 50px;
				margin-left : 50px;
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
				width : 500px;
				border : 0;
				outline : none;
				height : 30px;
				font-size : 20px;
			}
			#write-reply input:nth-of-type(3){
				text-align : center;
	        	color : white;
	        	background-color : #F39081;
	        	border : none;
	        	border-radius : 5px;
	        	padding : 6px 5px;
	        	margin-bottom : 3px
			}
		</style>
	</head>
	<body>
		<h1>${gBoard.groupName } 그룹 게시판</h1>
		<div id="board-area">
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
							<div class="comment-writeDate writeDate">${comment.writeDate }</div>
							<div class="replyWrite"><button onclick="writereply(this)">대댓글달기</button></div>
							<div class="comment-modArea modArea"></div>
						</div>
					</c:if>
					<c:if test="${comment.depth == 1 }">
						<div class="reply-area">
							<div class="reply-userNickName userNickName">${comment.userNickname }</div>
							<div class="reply-content content">${comment.content }</div>
							<div class="reply-writeDate writeDate">${comment.writeDate }</div>
							<div class="reply-modArea modArea"></div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	<script>
		function writereply(writeArea){
			var replyarea = document.querySelector("#write-reply")
			if(replyarea == null){
			var writer = document.createElement("input");
			writer.setAttribute("readonly", true);
			writer.setAttribute("value", "${loginUser}")
			var content = document.createElement("input");
			content.setAttribute("type","text")
			var submit = document.createElement("input");
			submit.setAttribute("type", "submit");
			submit.setAttribute("value", "대댓글쓰기");
			var form = document.createElement("form");
			form.setAttribute("action", "");
			form.setAttribute("method", "post");
			form.append(writer);
			form.append(content);
			form.append(submit);
			var writePlace = document.createElement("div");
			writePlace.setAttribute("id", "write-reply")
			writeArea.parentNode.parentNode.after(writePlace);
			writePlace.append(form);				
			}else{
				if(replyarea != (writeArea.parentNode.parentNode.nextSibling)){
					var writer = document.createElement("input");
					writer.setAttribute("readonly", true);
					writer.setAttribute("value", "${loginUser}")
					var content = document.createElement("input");
					content.setAttribute("type","text")
					var submit = document.createElement("input");
					submit.setAttribute("type", "submit");
					submit.setAttribute("value", "대댓글쓰기");
					var form = document.createElement("form");
					form.setAttribute("action", "");
					form.setAttribute("method", "post");
					form.append(writer);
					form.append(content);
					form.append(submit);
					var writePlace = document.createElement("div");
					writePlace.setAttribute("id", "write-reply")
					writeArea.parentNode.parentNode.after(writePlace);
					writePlace.append(form);					
				}
				replyarea.remove();
			}
		}
	</script>
	</body>
</html>