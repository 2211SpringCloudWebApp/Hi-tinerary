<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../../../../resources/css/usermypagewritereplylist.css">
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
		</header>
		<main>
		   <div class="mypage-container">
		        <div class="mypage-navbox">
		            <p class="nav-content">닉네임 님</p>
		            <a href="" class="nav-btn">내 정보 조회</a>
		            <a href="" class="nav-btn nownav">상품 구매내역 조회</a>
		            <a href="" class="nav-btn">작성 글 조회</a>
		            <a href="" class="nav-btn">작성 댓글 조회</a>
		            <a href="" class="nav-btn">그룹 페이지</a>
		        </div>
		        <div class="mypage-contentbox">
		            <div class="mypage-title">
		                <p>작성 댓글 조회</p>
		            </div>
		            <div class="mypage-content">
		                <div class="selectboard">
		                    <a href="" class="selectboard-btn">동행구하기</a>
		                    <a href="" class="selectboard-btn selectedboard-btn">자유게시판</a>
		                </div>
		                <div class="boardlist-box">
		                    <div class="boardlist">
		                        <div class="reply-box">
		                            <table class="reply">
		                                <thead>
		                                    <tr>
		                                        <th width="500">내용</th>
		                                        <th width="200">쓴날짜</th>
		                                        <th width="100">비고</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td><a href="">글제목글제목글제목ㅇㄴㅁㅇㄴㅁㅇㅁㄴㄴㅇㅁㄴㅇㄴㅁ</a></td>
		                                        <td>2020/12/12</td>
		                                        <td><a href="#" class="detail-btn">원문보기</a></td>
		                                    </tr>
		                                    <tr>
		                                        <td><a href="">글제목글제목글제목ㅇㄴㅁㅇㄴㄴㅇㅁㄴㅇㄴㅁ</a></td>
		                                        <td>1</td>
		                                        <td><a href="#" class="detail-btn">원문보기</a></td>
		                                    </tr>
		                                </tbody>
		                                <tfoot>
		                                    <tr>
		                                        <td colspan="3">
		                                            <a href="#" class="pagenav">&#60;&#60;</a>
		                                            <a href="#" class="pagenav">&#60;</a>
		                                            <a href="#">1</a>
		                                            <a href="#">2</a>
		                                            <a href="#">3</a>
		                                            <a href="#">4</a>
		                                            <a href="#">5</a>
		                                            <a href="#" class="pagenav">&#62;</a>
		                                            <a href="#" class="pagenav">&#62;&#62;</a>
		                                        </td>
		                                    </tr>
		                                </tfoot>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div> 
		    </div>
		</main>
	</body>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>
</html>