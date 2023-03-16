<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" href="${path }../../../resources/css/login.css"/>
	</head>
	<body>
		<div id="container">
        	<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
			<main>
	            <div id="login-area">
	                <h2>로그인</h2>
	                <form action="/user/login" method="post">
	                    <div class="input-area">
	                        <input type="text" name="userId" placeholder="아이디" required>
	                        <label for="id">아이디</label>
	                    </div>
	                    <div class="input-area">
	                        <input type="password" name="userPw" placeholder="비밀번호" required>
	                        <label for="id">비밀번호</label>
	                    </div>
	                    <div id="btn-area">
	                        <input type="submit" value="로그인">
	                        <a href="/user/registerType">
	                        <input type="button" value="회원가입">
	                        </a>
	                    </div>
	                </form>
	            </div>
	        </main>
	        <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	</body>
</html>