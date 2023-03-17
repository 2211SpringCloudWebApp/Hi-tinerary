<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가입유형선택</title>
		<link rel="stylesheet" href="${path }../../../resources/css/registerType.css"/>
	</head>
	<body>
		<div id="container">
        	<header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
			</header>
			<main>
	            <div class="type-area">
	                <div class="btn-area">
	                    <h2>일반회원</h2>
	                    <button><a href="/user/registerUser">가입하기</a></button>
	                </div>
	            </div>
	            <div class="type-area">
	                <div class="btn-area">
	                    <h2>기업회원</h2>
	                    <button><a href="/user/registerCompany">가입하기</a></button>
	                </div>
	            </div>
	        </main>
	        <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</footer>
		</div>
	</body>
</html>