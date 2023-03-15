<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 마이페이지</title>
		<link rel="stylesheet" href="../../../resources/css/managerMypage.css">
	</head>
	<body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <div id="container">
        	<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
            <table class="managerTable" id="managerTable1">
                <tr>
                    <td>"닉네임" 님</td>
                </tr>
                <tr>
                    <td><button id="user" onclick="selectUser();">일반회원 조회</button></td>
                </tr>
                <tr>
                    <td><button id="seller" onclick="selectSeller();">기업회원 조회</button></td>
                </tr>
                <tr>
                    <td><button id="all" onclick="selectAll();">전체게시글 조회</button></td>
                </tr>
                <tr>
                    <td><button id="report" onclick="selectReport();">신고 게시글 조회</button></td>
                </tr>
            </table>
            <table class="managerTable" id="managerTable2">
                <tr>
                    <td id="managerTableTd1">
                        <div id="managerText">일반회원 조회</div>
                    </td>
                </tr>
                <tr>
                    <td id="managerTableTd2">

                    </td>
                </tr>
            </table>
        </div>
        <footer>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</footer>
        <script>
            var user = document.querySelector("#user");
            var seller = document.querySelector("#seller");
            var all = document.querySelector("#all");
            var report = document.querySelector("#report");
            var managerText = document.querySelector("#managerText");
        
            function selectUser(){
                //일반회원 조회
                user.style.backgroundColor = "#0F8D80";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "";

                managerText.textContent = "일반회원 조회";
            }
        
            function selectSeller(){
                // 기업회원 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "#0F8D80";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "";
        
                managerText.textContent = "기업회원 조회";
            }
        
            function selectAll(){
                // 전체게시글 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "#0F8D80";
                report.style.backgroundColor = "";
        
                managerText.textContent = "신고 게시글 조회";
            }
        
            function selectReport(){
                //신고 게시글 조회
                user.style.backgroundColor = "";
                seller.style.backgroundColor = "";
                all.style.backgroundColor = "";
                report.style.backgroundColor = "#0F8D80";
        
                managerText.textContent = "신고 댓글 조회";
            }
        </script>
	</body>
</html>