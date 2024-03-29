<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../../resources/css/headerNav.css">
    </head>
    <body>
        <div id="container">
            <header>
                <div id="logo">
                    <img id="logo-img" src="../../../resources/images/icon.png">
                    <img id="logo-typo" src="../../../resources/images/logo-typo.png">
                </div>
                <nav>
                    <ul>
                        <li>&nbsp;&nbsp; <a href="/index.jsp">홈</a>&nbsp;&nbsp; | </li>
                        <li>&nbsp;&nbsp; <a href="/tour/tourBoardList">투어상품</a>&nbsp;&nbsp; | </li>
                        <li>&nbsp;&nbsp; <a href="/withboard/withBoardList">동행구하기</a>&nbsp;&nbsp; |</li>
                        <li>&nbsp;&nbsp; <a href="/freeboard/list">자유게시판</a>&nbsp;&nbsp; |</li>
                    </ul>
                </nav>
                <c:if test="${sessionScope.loginUser eq null }">
               	 	<div id="user-id">
	                    <ul>
	                        <li>|&nbsp;&nbsp; <a href="/user/registerType">회원가입</a>&nbsp;&nbsp; |</li>
	                        <li>&nbsp;&nbsp; <a href="/user/login">로그인</a> &nbsp;&nbsp;|</li>
	                    </ul>
	                </div>
	                </c:if>
	                <c:if test= "${sessionScope.loginUser ne null }">
					<div id="user-id">
						<p>
							${sessionScope.loginUser.userNickname } 님 환영합니다!	
							<input type="hidden" value="${sessionScope.loginUser.userGrade }">
							<input type="hidden" name=userNo value="${sessionScope.loginUser.userNo }">	
						</p>
	                    <ul>
	                    	<c:if test="${loginUser.userGrade == 0 }">
		                        <li>|&nbsp;&nbsp; <a href="/user/mypage">마이페이지</a>&nbsp;&nbsp; |</li>
	                    	</c:if>             
	                    	<c:if test="${loginUser.userGrade == 1 || loginUser.userGrade == 2}">
		                        <li>|&nbsp;&nbsp; <a href="/user/mypageCompany">마이페이지</a>&nbsp;&nbsp; |</li>
	                    	</c:if>    
	                    	<c:if test="${loginUser.userGrade == 4}">
		                        <li>|&nbsp;&nbsp; <a href="/manager/mypage">마이페이지</a>&nbsp;&nbsp; |</li>
	                    	</c:if>            
	                        <li>&nbsp;&nbsp; <a href="/user/logout">로그아웃</a> &nbsp;&nbsp;|</li>
	                    </ul>
	                </div>
                </c:if>
            </header>
        </div>    
    </body>
</html>
