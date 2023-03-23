<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 마이페이지</title>
		<link rel="stylesheet" href="../../../resources/css/managerMypage.css">
	</head>
	<body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- 헤더 -->
		<header>
            <jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
        </header>
        
        <div id="container">
            <table class="managerTable" id="managerTable1">
                <tr>
                    <td>운영자 님</td>
                </tr>
                <tr>
                    <td><button id="user" onclick="selectUser();">일반회원 조회</button></td>
                </tr>
                <tr>
                    <td><button id="seller" onclick="selectSeller();">기업회원 조회</button></td>
                </tr>
                <tr>
                    <td><button id="all" onclick="selectAll();">신고 게시글 조회</button></td>
                </tr>
                <tr>
                    <td><button id="report" onclick="selectReport();">신고 댓글 조회</button></td>
                </tr>
            </table>
            <table class="managerTable" id="managerTable2">
                <tr>
                    <td id="managerTableTd1">
                        <div id="managerText">일반회원 조회</div>
                    </td>
                </tr>
                <tr>
                    <td id="userTd" style="display: block;">
                        <table class="managerShowTable">
                            <tr class="headTr">
                                <td>아이디</td>
                                <td>비밀번호</td>
                                <td>이름</td>
                                <td>닉네임</td>
                                <td>메일주소</td>
                                <td>전화번호</td>
                                <td>생년월일</td>
                                <td>성별</td>
                                <td></td>
                            </tr>
                            <c:forEach items="${uList}" var="userList">
							    <tr>
							        <td>${userList.userId}</td>
							        <td>${userList.userPw}</td>
							        <td>${userList.userName}</td>
							        <td>${userList.userNickname}</td>
							        <td>${userList.userEmail}</td>
							        <td>${userList.userPhone}</td>
							        <td>${userList.userBirthDate}</td>
							        <td>${userList.userGender}</td>
							        <td>
							        	<form action="/manager/deleteUser" method="POST">
							        		<input type="hidden" name="userNo" value="${userList.userNo}">
							        		<button type="submit" id="userTablebutton" class="managerBtn" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
							       		</form>
							        </td>
							    </tr>
							</c:forEach>
                         </table>
                    </td>
                    <td id="sellerTd" style="display: none;">
                         <table class="managerShowTable">
                            <tr class="headTr">
                                <td>아이디</td>
                                <td>비밀번호</td>
                                <td>사업자명 </td>
                                <td>사업자등록번호 </td>
                                <td>메일주소</td>
                                <td>전화번호</td>
                                <td colspan="3"></td>

                            </tr>
                            <c:forEach items="${sList}" var="sellerList">
	                            <tr>
	                                <td>${sellerList.userId }</td>
	                                <td>${sellerList.userPw }</td>
	                                <td>${sellerList.userNickname }</td>
	                                <td>${sellerList.companyRegiNo }</td>
	                                <td>${sellerList.userEmail }</td>
	                                <td>${sellerList.userPhone }</td>
	                                <td>
	                                	<c:if test="${sellerList.userGrade == 3}">
	                                		<button class = "managerBtn" id="sellerBtn1" >탈퇴대기</button>
	                                	</c:if>
	                                </td>
	                                <td>
	                                	<form action="/manager/deleteUser" method="POST">
							        		<input type="hidden" name="userNo" value="${sellerList.userNo}">
		                                	<button type="submit" class = "managerBtn" id="sellerBtn2" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</class=button>
							       		</form>
	                                </td>
	                                <td>
	                                	<c:if test="${sellerList.userGrade == 1}">
	                                		<form action="/manager/sellerGarde" method="POST">
	                                			<input type="hidden" name="userNo" value="${sellerList.userNo}">
		                                		<input type="hidden" name="userGrade" value="${sellerList.userGrade}">
		                                		<button type="submit" class = "managerBtn" id="sellerBtn3" onclick="return confirm('권한부여를 하시겠습니까?')">권한대기</button>
	                                		</form>
	                                	</c:if>
	                                	<c:if test="${sellerList.userGrade == 2 || sellerList.userGrade == 3}">
	                                		<form action="/manager/sellerGarde" method="POST">
	                                			<input type="hidden" name="userNo" value="${sellerList.userNo}">
		                                		<input type="hidden" name="userGrade" value="${sellerList.userGrade}">
		                                		<button type="submit" class = "managerBtn" id="sellerBtn3" onclick="return confirm('권한부여를 제거겠습니까?')">권한완료</button>
	                                		</form>
	                                	</c:if>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td id="allTd" style="display: none;">
                        <table class="managerShowTable">
                            <tr class="headTr">
                                <td>게시판</td>
                                <td>제목</td>
                                <td>신고일</td>
                                <td>신고자</td>
                                <td>신고사유</td>
                                <td>작성자</td>
                            </tr>
                            <c:forEach items="${brList}" var="bReportList">
							    <tr>
							        <td>
							        	<c:if test="${bReportList.whthBoardNo != 0}">
							        		동행
							        	</c:if>
							        	<c:if test="${bReportList.freeBoardNo != 0}">
							        		자유
							        	</c:if>
							        	<c:if test="${bReportList.tourNo != 0}">
							        		투어
							        	</c:if>
							        </td>
							        <td>
							        	<c:if test="${bReportList.whthBoardNo != 0}">
							        		<a href="/withboard/withBoardDetail?boardNo=${bReportList.whthBoardNo }">${bReportList.boardTitle }</a>
							        	</c:if>
							        	<c:if test="${bReportList.freeBoardNo != 0}">
							        		<a href="/freeboard/detail?boardNo=${bReportList.freeBoardNo }">${bReportList.boardTitle }</a>
							        	</c:if>
							        	<c:if test="${bReportList.tourNo != 0}">
							        		<a href="/tour/tourBoardDetail?tourNo=${bReportList.tourNo }">${bReportList.boardTitle }</a>
							        	</c:if>
							        </td>
							        <td>
							        	${fn:substring(bReportList.reportDate, 0, 10)} 오전 ${fn:substring(bReportList.reportDate, 11, 13)}시
							  		</td>
							        <td>${bReportList.reporterNickname}</td>
							        <td>${bReportList.reportReason}</td>
							        <td>${bReportList.boardWriterNickname}</td>
							    </tr>
							</c:forEach>
                        </table>
                    </td>
                    <td id="reportTd" style="display: none;">
                        <table class="managerShowTable">
                            <tr class="headTr">
                                <td>내용</td>
                                <td>작성자</td>
                                <td>신고자</td>
                                <td>신고사유</td>
                                <td>신고일</td>
                            </tr>
                            <c:forEach items="${crList}" var="cReportList">
							    <tr>
							        <td>
							        	<c:if test="${cReportList.whthBoardNo != 0}">
							        		<a href="/withboard/withBoardDetail?boardNo=${cReportList.whthBoardNo }">${cReportList.boardTitle }</a>
							        	</c:if>
							        	<c:if test="${cReportList.freeBoardNo != 0}">
							        		<a href="/freeboard/detail?boardNo=${cReportList.freeBoardNo }">${cReportList.boardTitle }</a>
							        	</c:if>
							        	<c:if test="${cReportList.tourNo != 0}">
							        		<a href="/tour/tourBoardDetail?tourNo=${cReportList.tourNo }">${cReportList.boardTitle }</a>
							        	</c:if>
							        </td>
							        <td>${cReportList.boardWriterNickname}</td>
							        <td>${cReportList.reporterNickname}</td>
							        <td>${cReportList.reportReason}</td>
							        <td>${fn:substring(cReportList.reportDate, 0, 10)} 오전 ${fn:substring(cReportList.reportDate, 11, 13)}시</td>
							    </tr>
							</c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <script>
            var user = document.querySelector("#user");
            var seller = document.querySelector("#seller");
            var all = document.querySelector("#all");
            var report = document.querySelector("#report");
            var managerText = document.querySelector("#managerText");
        
            var userTd = document.querySelector("#userTd");
            var sellerTd = document.querySelector("#sellerTd");
            var allTd = document.querySelector("#allTd");
            var reportTd = document.querySelector("#reportTd");

            function selectUser(){
                //일반회원 조회
                user.style.backgroundColor = "#0F8D80";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "";

                userTd.style.display = 'block';
                sellerTd.style.display = 'none';
                allTd.style.display = 'none';
                reportTd.style.display = 'none';

                managerText.textContent = "일반회원 조회";
            }
        
            function selectSeller(){
                // 기업회원 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "#0F8D80";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "";

                userTd.style.display = 'none';
                sellerTd.style.display = 'block';
                allTd.style.display = 'none';
                reportTd.style.display = 'none';
       
                managerText.textContent = "기업회원 조회";
            }
        
            function selectAll(){
                // 전체게시글 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "#0F8D80";
                report.style.backgroundColor = "";

                userTd.style.display = 'none';
                sellerTd.style.display = 'none';
                allTd.style.display = 'block';
                reportTd.style.display = 'none';
              
                managerText.textContent = "신고 게시글 조회";
            }
        
            function selectReport(){
                //신고 게시글 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "#0F8D80";

                userTd.style.display = 'none';
                sellerTd.style.display = 'none';
                allTd.style.display = 'none';
                reportTd.style.display = 'block';

                managerText.textContent = "신고 댓글 조회";
            }
        </script>
        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </footer>
	</body>
</html>