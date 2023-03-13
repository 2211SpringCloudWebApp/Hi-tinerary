<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
		<style>
			#freeboardDiv{
                width: 1200px;
                margin-bottom: 50px; 
                margin-top: 50px; 
            }
            #freeboard_div1{
                width: 1200px;
                height: 100px;
            }
                #freeboard_td1{
                    width: 40%;
                    height: 100%;
                    float: left;
                }

                #freeboard_td2{
                    width: 40%;
                    height: 100%;
                    float: left;
                }

                #freeboard_td3{
                    width: 20%;
                    height: 100%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    float: left;
                }

            #freeboard_div2{
                width: 1200px;
                height: 600px;
                margin-top: 30px;
                margin-bottom: 30px;
            }

            ul {
                list-style: none; /* 리스트 기본 스타일 제거 */
                display: flex; /* Flexbox 사용 */
                align-items: center; /* 아이템을 수직 방향으로 가운데 정렬 */
                padding: 0; /* 리스트 안쪽 여백 제거 */
            }
            ul li{
                margin-left: 5px;
                margin-right: 5px;
            }
            ul li a{
                color: black;
                text-decoration: none;
            }
            
            #button1{
            	border-style: none;
            }
            #h2span{
            }
		</style>
	</head>
	<body>
		<!-- 헤더 -->
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<!-- 메인 -->
		<main>
				<div id="freeboard_div1">
            		<div id="freeboard_td1">
            		<a href="/freeboard/detail?boardNo=${freeboard.boardNo }">${freeboard.boardTitle }</a>
		                <ul>
		                    <li><a href="/freeboard/list?boardHead=all" >전체보기</a></li>|
		    				<li><a href="/freeboard/list?boardHead=question" >질문</a></li>|
		    				<li><a href="/freeboard/list?boardHead=free" >잡담</a></li>
		                </ul>
        	   		</div>
            		<div id="freeboard_td2"></div>
            		<div id="freeboard_td3">
                		<input type="button" id="button1" value="새글쓰기" onclick="location.href='/freeboard/write'">
            		</div>
        		</div>
        		<div id="freeboard_div2">
	            <table style="width: 1000px; margin-left: 50px; margin-right: 50px;">
					<tbody style="height: 400px;">
					
						<c:forEach items="${fList }" var="freeboard" varStatus="i">
							<tr style="border-top: solid 1px #FBD188; font-size:larger;">
								<td style="width: 5%; text-align: center;">
									${i.count }
								</td>
								<td style="width: 5%; text-align: center;">
									<c:if test="${freeboard.boardHead == 'free'}">잡담</c:if>
									<c:if test="${freeboard.boardHead == 'question'}">질문</c:if>
								</td>
								<td style="width: 60%;">
									<a href="/freeboard/detail?boardNo=${freeboard.boardNo }">${freeboard.boardTitle }</a>
								</td>
								<td style="width: 15%;">
									작성자
								</td>
								<td style="width: 15%; text-align: center;">
									<c:if test="${freeboard.boardHead == 'question'}">
										<c:if test="${freeboard.boardCheck == 0}">답변대기</c:if>
										<c:if test="${freeboard.boardCheck == 1}">답변완료</c:if>					
									</c:if>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
					<!-- 페이징처리 -->
					<tfoot style="height: 100px">
						<tr align="center">
							<td colspan="5">
								<c:if test="${pi.startNavi != 1}">
									<a href=""> < </a>
								</c:if>
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/freeboard/search">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchValue" value="${search.searchValue }"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
								<a href=""> > </a>
							</td>
						</tr>
					</tfoot>
				</table>
	        </div>
		</main>
		<!-- 푸터 -->
		<footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>