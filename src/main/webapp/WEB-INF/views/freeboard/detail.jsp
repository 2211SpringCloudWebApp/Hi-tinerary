<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 상세조회</title>
		<link rel="stylesheet" href="../../../resources/css/freeboardDetail.css">
		<link rel="stylesheet" href="../../../resources/css/freeboardComment.css">
		<link rel="stylesheet" href="../../../resources/css/freeboardCommentlist.css">
	</head>
	<body>
		<!-- 헤더 -->
		<header>
            <jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
        </header>
        <!-- 메인 -->
        <main>
            <div id="detail-content">
            	<jsp:include page="/WEB-INF/views/freeboard/freeboardNav.jsp"></jsp:include>
                <table id="detailTable1">
                    <tr>
                        <td>
                        	<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
                        	<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
                        </td>
                        <td>${freeboard.boardTitle }</td>
                        <td>${freeboard.userNickname }</td>
                        <td>
                        	<c:if test="${freeboard.boardHead == 'question'}">
                        		<c:if test="${freeboard.boardCheck == 0}">
                        			<div class="detailDiv" id = "detailDiv1">답변대기</div>
                        		</c:if>
                        		
                        		<c:if test="${freeboard.boardCheck == 1}">
                        			<div class="detailDiv" id = "detailDiv2">답변완료</div>
                        		</c:if>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <table id="detailTable2">
                    <tr>
                        <td></td>
                        <td>
                        	${fn:substring(freeboard.writeDate, 0, 10)} 오전 ${fn:substring(freeboard.writeDate, 11, 13)}시
                        	<c:if test="${loginUser.userNo != null }">
	                        	<c:if test="${freeboard.userNo == loginUser.userNo}">
	                        		<a href="/freeboard/modify?boardNo=${freeboard.boardNo}">수정</a> | 
	                        	</c:if>
	                        	<c:if test="${freeboard.userNo == loginUser.userNo || loginUser.userGrade == 4}">
	    	                    	<a href="/freeboard/remove?boardNo=${freeboard.boardNo }" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
	                        	</c:if>
	                        	<c:if test="${freeboard.userNo != loginUser.userNo && loginUser.userGrade != 4}">
		                        	<form action="/report" method="POST" >
									    <input type="hidden" name="userNo" value="${loginUser.userNo}">
										<input type="hidden" name="boardNo" value="${freeboard.boardNo}">
										<input type="hidden" name="boardTitle" value="${freeboard.boardTitle}">
										<input type="hidden" name="userNickname" value="${freeboard.userNickname}">
										<input type="hidden" name="commentNo" value= 0 >
										<input type="hidden" name="boardType" value="free">
										<a href="#" onclick="this.parentNode.submit(); return false;">신고</a>
									</form>
	                        	</c:if>
                        	</c:if>
                        </td>
                    </tr>
                </table>
                <!-- 이미지와 텍스트공간 영역 -->
                <table id="detailTable3">
                    <tr>
                    	<td>
                    		<c:if test="${freeboard.boardImage != null}">
                    			<img src="../../../../${freeboard.boardImage }">
                    		</c:if>
                    	</td>
                    </tr>
                    <tr>
                    	<td style="font-size: 20px; height: 50px;">
                    		${freeboard.boardSubject }
                    	</td>
                    </tr>
                </table>
                <!-- 댓글이 출력되는 영역 -->
               	<c:forEach items="${cList }" var="comment" varStatus="i">
               		<!-- 댓글 리스트 -->
               		<c:if test="${comment.depth == 0 }">
               			<div id="lcomment_container">
				            <table id="lcomment_table">
				                <tr>
				                    <td id="lcomment_td1">${comment.userNickname}</td>
				                    <td id="lcomment_td2"><input id="lcomment_input" type="text" readonly value="${comment.content}"></td>
				                    <td id="lcomment_td3"><fmt:formatDate value="${comment.updateDate }" pattern="yyyy-MM-dd ahh:mm" /></td>
				                    <c:if test="${loginUser.userNo != comment.userNo && loginUser.userNo == freeboard.userNo && freeboard.boardHead == 'question' && freeboard.boardCheck == 0}">
					                    <td id="lcomment_td4">
					                    	<form action="/freeboard/comment/status" method="POST">
					                    		<input name="boardNo" type="text" value="${freeboard.boardNo }" style="display:none">
					                    		<input name="commentNo" type="text" value="${comment.commentNo }" style="display:none">
						                    	<button type="submit" id="lcomment_button2">채택하기</</button>
					                    	</form>
					                    </td>
				                    </c:if>
				                    <c:if test="${freeboard.boardCheck == 1 && comment.status == 1}">
					                    <td id="lcomment_td4">
				                    		<input name="boardNo" type="text" value="${freeboard.boardNo }" style="display:none">
				                    		<input name="commentNo" type="text" value="${comment.commentNo }" style="display:none">
					                    	<button type="submit" id="lcomment_button3" >채택댓글</</button>
					                    </td>
				                    </c:if>
				                    <td id="lcomment_td5">
				                    	<c:if test="${loginUser.userNo != null }">
				                    		<a href="#"  onclick="showCommentInput(this)">댓글달기</a>
				                    		<c:if test="${comment.status == 0 }">
					                    		<c:if test="${comment.userNo == loginUser.userNo || loginUser.userGrade == 4}">
					                    			<form action="/freeboard/comment/delete" method="post">
														<input type="hidden" name="commentNo" value="${comment.commentNo}">
														| <a href="#" onclick="if (confirm('정말 삭제하시겠습니까?')) {this.parentNode.submit()}">삭제</a>
					                    			</form>
					                    		</c:if>
				                    		</c:if>
				                    		<c:if test="${loginUser.userNo != null && comment.userNo != loginUser.userNo && loginUser.userGrade != 4}">
				                    			<form action="/report" method="POST">
				                    			 	${comment.commentNo}
												    <input type="hidden" name="userNo" value="${loginUser.userNo}">
													<input type="hidden" name="boardNo" value="${freeboard.boardNo}">
													<input type="hidden" name="commentNo" value="${comment.commentNo}">
													<input type="hidden" name="boardTitle" value="${freeboard.boardTitle}">
													<input type="hidden" name="userNickname" value="${freeboard.userNickname}">
													<input type="hidden" name="boardType" value="free">
													<a href="#" onclick="this.parentNode.submit(); return false;">신고</a>
												</form>
				                    		</c:if>
				                    	</c:if>
				                    </td>
				                </tr>
				            </table>
			        	</div>
               		</c:if>
               		<!-- 대댓글 리스트 -->
               		<c:if test="${comment.depth == 1 }">
               			<div class="rerere">
							<div id="lcomment_container">
								<table id="lcomment_table">
									<tr>
										<td id="lcomment_td1">${comment.userNickname}</td>
										<td id="lcomment_td2"><input id="lcomment_input" type="text" readonly value="${comment.content}"></td></td>
										<td id="lcomment_td3"><fmt:formatDate value="${comment.updateDate }" pattern="yyyy-MM-dd ahh:mm" /></td>
										<td id="lcomment_td5">
											<c:if test="${loginUser.userNo != null }">
				                    		<c:if test="${comment.status == 0 }">
					                    		<c:if test="${comment.userNo == loginUser.userNo || loginUser.userGrade == 4}">
					                    			<form action="/freeboard/comment/delete" method="post">
														<input type="hidden" name="commentNo" value="${comment.commentNo}">
														| <a href="#" onclick="if (confirm('정말 삭제하시겠습니까?')) {this.parentNode.submit()}">삭제</a>
					                    			</form>
					                    		</c:if>
				                    		</c:if>
				                    		<c:if test="${loginUser.userNo != null && comment.userNo != loginUser.userNo && loginUser.userGrade != 4}">
				                    			<form action="/report" method="POST">
												    <input type="hidden" name="userNo" value="${loginUser.userNo}">
													<input type="hidden" name="boardNo" value="${freeboard.boardNo}">
													<input type="hidden" name="commentNo" value="${comment.commentNo}">
													<input type="hidden" name="boardTitle" value="${freeboard.boardTitle}">
													<input type="hidden" name="userNickname" value="${freeboard.userNickname}">
													<input type="hidden" name="boardType" value="free">
													<a href="#" onclick="this.parentNode.submit(); return false;">신고</a>
												</form>
				                    		</c:if>
				                    	</c:if>
										</td>
									</tr>
								</table>
							 </div>
						</div>
               		</c:if>
               	</c:forEach>
               	
                <!-- 댓글 작성 하는 영역 -->
			    <c:if test="${loginUser.userNo != null }">
	                <div id="comment_container">
			            <table id="comment_table">
			                <tr>
			                	<form action="/freeboard/comment/write" method="POST" enctype="multipart/form-data">
			                		<input type="hidden" name="boardNo" value="${freeboard.boardNo }">
			                		<input type="hidden" name="userNo" value="${loginUser.userNo }">
				                    <input type="hidden" name="depth" value = 0>
				                    <td id="comment_td1" name ="userNickname">${loginUser.userNickname}</td>
				                    <td id="comment_td2"><input name="content" id="comment_input" type="text" placeholder="여기에 댓글을 작성해 주세요."></td>
				                    <td id="comment_td3">
				                    	<button type="submit" id="comment_button">댓글달기</button>
				                    </td>
			                	</form>
			                </tr>
			            </table>
			        </div>
			    </c:if>
			    <!-- 대댓글 작성 영역 -->
			    <c:if test="${loginUser.userNo != null }">
			    	<div class="rerere writeReReply" id="writeReReply">
				    	<div id="comment_container">
				        	<table id="comment_table">
				            	<tr>
				            		<form action="/freeboard/comment/write" method="POST" enctype="multipart/form-data">
				             			<input type="hidden" name="boardNo" value="${freeboard.boardNo }">
			                			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			                			<input type="hidden" name="depth" value = 1>
				                  		<td id="comment_td1" name ="userNickname">${loginUser.userNickname}</td>
				                  		<td id="comment_td2"><input name="content" id="comment_input" type="text" placeholder="여기에 댓글을 작성해 주세요."></td>
				                  		<td id="comment_td3">
				                  			<button type="submit" id="comment_button">댓글달기</button>
				                  		</td>
				             		</form>
				             	</tr>
				         	</table>
				    	</div>
			    	</div>
			    </c:if>
            </div>
        </main>
        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </footer>
        <script>
			function showCommentInput(btn){
				var a = window.event;
				a.preventDefault();
				
				var commentBox = btn.parentNode.parentNode.parentNode.parentNode.parentNode;
				var writeBox = document.querySelector("#writeReReply");
				
				if(commentBox.nextElementSibling == writeBox){
					writeBox.style.display = "none";
					commentBox.before(writeBox);
				}else{
				commentBox.after(writeBox);
				writeBox.style.display = "block";
					
				}
			}
        </script>
	</body>
</html>