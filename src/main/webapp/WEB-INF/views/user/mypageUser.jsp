<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>일반회원 마이페이지</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="../../../resources/css/mypage.css"/>
    </head>
    <body>
    	<div id="container">
        	<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
	        <main>
	            <table class="user-table" id="side-nav">
	                <tr>
	                    <td>${sessionScope.loginUser.userNickname } 님</td>
	                </tr>
	                <tr>
	                    <td><button id="info" onclick="selectInfo();">내 정보 조회</button></td>
	                </tr>
	                <tr>
	                    <td><button id="buy" onclick="selectBuy();">구매내역 조회</button></td>
	                </tr>
	                <tr>
	                    <td><button id="post" onclick="selectPost();">작성 글 조회</button></td>
	                </tr>
	                <tr>
	                    <td><button id="comment" onclick="selectComment();">작성 댓글 조회</button></td>
	                </tr>
	                <tr>
	                    <td><button id="group" onclick="selectGroup();">그룹 페이지</button></td>
	                </tr>
	            </table>
	            <table class="user-table" id="main-area">
	                <tr>
	                    <td id="tbl-top">
	                        <div id="menuTitle">내 정보 조회</div>
	                    </td>
	                </tr>
	                <tr>
						<td id="infoTbl" style="display: block;">
							<jsp:include page="/WEB-INF/views/user/myinfoUser.jsp"/>
	                    </td>
	                    <td id="buyTbl" style="display: none;">
	                        
	                    </td>
	                    <td id="postTbl" style="display: none;">
	                        
	                    </td>
	                    <td id="commentTbl" style="display: none;">
	                        
	                    </td>
	                    <td id="groupTbl" style="display: none;">
	                        
	                    </td>
	                </tr>
	            </table>
	        </main>
	        <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
        <script>
            var info = document.querySelector("#info");
            var buy = document.querySelector("#buy");
            var post = document.querySelector("#post");
            var comment = document.querySelector("#comment");
            var group = document.querySelector("#group");
            
            var menuTitle = document.querySelector("#menuTitle");
            
            var infoTbl = document.querySelector("#infoTbl");
            var buyTbl = document.querySelector("#buyTbl");
            var postTbl = document.querySelector("#postTbl");
            var commentTbl = document.querySelector("#commentTbl");
            var groupTbl = document.querySelector("#groupTbl");
        
            // 내 정보 조회
            function selectInfo(){
            	info.style.backgroundColor = "#F38981";
            	buy.style.backgroundColor = "";
            	post.style.backgroundColor = "";
            	comment.style.backgroundColor = "";
            	group.style.backgroundColor = "";

            	menuTitle.textContent = "내 정보 조회";
            	
            	infoTbl.style.display = 'block';
            	buyTbl.style.display = 'none';
            	postTbl.style.display = 'none';
            	commentTbl.style.display = 'none';
            	groupTbl.style.display = 'none';
            }
        
         	// 구매내역 조회
            function selectBuy(){
            	info.style.backgroundColor = "";
            	buy.style.backgroundColor = "#F38981";
            	post.style.backgroundColor = "";
            	comment.style.backgroundColor = "";
            	group.style.backgroundColor = "";

            	menuTitle.textContent = "구매내역 조회";
            	
            	infoTbl.style.display = 'none';
            	buyTbl.style.display = 'block';
            	postTbl.style.display = 'none';
            	commentTbl.style.display = 'none';
            	groupTbl.style.display = 'none';
            }
         	
         	// 작성 글 조회
            function selectPost(){
            	info.style.backgroundColor = "";
            	buy.style.backgroundColor = "";
            	post.style.backgroundColor = "#F38981";
            	comment.style.backgroundColor = "";
            	group.style.backgroundColor = "";

            	menuTitle.textContent = "작성 글 조회";
            	
            	infoTbl.style.display = 'none';
            	buyTbl.style.display = 'none';
            	postTbl.style.display = 'block';
            	commentTbl.style.display = 'none';
            	groupTbl.style.display = 'none';
         	}
         	
         	// 작성 댓글 조회
            function selectComment(){
            	info.style.backgroundColor = "";
            	buy.style.backgroundColor = "";
            	post.style.backgroundColor = "";
            	comment.style.backgroundColor = "#F38981";
            	group.style.backgroundColor = "";

            	menuTitle.textContent = "작성 댓글 조회";
            	
            	infoTbl.style.display = 'none';
            	buyTbl.style.display = 'none';
            	postTbl.style.display = 'none';
            	commentTbl.style.display = 'block';
            	groupTbl.style.display = 'none';
         	}
         	
         	// 그룹 페이지
            function selectGroup(){
            	info.style.backgroundColor = "";
            	buy.style.backgroundColor = "";
            	post.style.backgroundColor = "";
            	comment.style.backgroundColor = "";
            	group.style.backgroundColor = "#F38981";

            	menuTitle.textContent = "그룹 페이지";
            	
            	infoTbl.style.display = 'none';
            	buyTbl.style.display = 'none';
            	postTbl.style.display = 'none';
            	commentTbl.style.display = 'none';
            	groupTbl.style.display = 'block';
         	}
        </script>
    </body>
</html>