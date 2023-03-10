<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="path" value="${pageContext.request.contextPath }"/> 

	<head>
		<meta charset="UTF-8">
		
	 <link rel="stylesheet" href="${path }../../../resources/css/headerNav.css"/>
    </head>
    <body>
        <div id="container">
            <header>
                <div id="logo">
                    <img id="logo-img" src="../../../resources/images/logo-img.png">
                    <img id="logo-typo" src="../../../resources/images/logo-typo.png">
                </div>
                <nav>
                    <ul>
                        <li>|&nbsp;&nbsp; <a href="#">홈</a>&nbsp;&nbsp; |</li>
                        <li>&nbsp;&nbsp; <a href="/tour/tourBoardList">투어상품</a>&nbsp;&nbsp; | </li>
                        <li>&nbsp;&nbsp; <a href="#">동행구하기</a>&nbsp;&nbsp; |</li>
                        <li>&nbsp;&nbsp; <a href="#">자유게시판</a>&nbsp;&nbsp; |</li>
                    </ul>
                </nav>
                <c:if test= "${sessionScope.loginUser eq null }">
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
					</p>
                    <ul>
                        <li>|&nbsp;&nbsp; <a href="/user/registerType">마이페이지</a>&nbsp;&nbsp; |</li>
                        <li>&nbsp;&nbsp; <a href="/user/logout">로그아웃</a> &nbsp;&nbsp;|</li>
                    </ul>
                </div>
				</c:if>
            </header>
        </div>    
    </body>