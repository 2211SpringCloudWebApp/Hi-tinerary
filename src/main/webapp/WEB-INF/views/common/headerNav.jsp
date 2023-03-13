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
                        <li>&nbsp;&nbsp; <a href="/withBoard/withBoardList">동행구하기</a>&nbsp;&nbsp; |</li>
                        <li>&nbsp;&nbsp; <a href="/freeboard/list">자유게시판</a>&nbsp;&nbsp; |</li>
                    </ul>
                </nav>
                <c:if test="${sessionScope.loginUser eq null }">
               	 	<div id="user-id">
	                    <ul>
	                        <li>|&nbsp;&nbsp; <a href="#">회원가입</a>&nbsp;&nbsp; |</li>
	                        <li>&nbsp;&nbsp; <a href="#">로그인</a> &nbsp;&nbsp;|</li>
	                    </ul>
                	</div>
                </c:if>
                <c:if test="${sessionScope.loginUser ne null }">
                	<div>
                		<b></b>님 환영합니다.
                		<a href="">마이페이지</a>
                		<a href="">로그아웃</a>
                	</div>
                </c:if>
            </header>
        </div>    
    </body>
</html>
