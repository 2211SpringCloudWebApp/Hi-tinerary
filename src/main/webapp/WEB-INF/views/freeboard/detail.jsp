<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>자유게시판 상세조회</title>
		<style>
			#detail-content {
				width: 1200px;
				margin: 0 auto;
			}
			
			table {
				width: 100%;
			}
			
			#detailTable1 {
				margin-top: 20px;
				border-top: 1px solid #FBD188;
				border-bottom: 1px solid #FBD188;
				text-align: center;
				height: 50px;
			}
			
			#detailTable1 td:nth-child(1) {
				width: 10%;
			}
			
			#detailTable1 td:nth-child(2) {
				text-align: left;
				width: 70%;
			}
			
			#detailTable1 td:nth-child(3) {
				width: 10%;
			}
			
			#detailTable1 td:nth-child(4) {
				width: 10%;
			}
			
			#detailTable1 td:nth-child(4) div {
				display: flex; /* flexbox를 이용하여 요소를 수직 정렬 */
				justify-content: center; /* 가로 중앙 정렬 */
				align-items: center; /* 세로 중앙 정렬 */
				width: 90%;
				height: 90%;
				border-radius: 10px;
				background-color: #F39081;
				margin: 0 auto;
				text-align: center;
				line-height: 1.8; /* 텍스트의 세로 가운데 정렬 */
			}
			
			#detailTable2 {
				font-size: 10px;
				height: 30px;
			}
			
			#detailTable2 td:nth-child(1) {
				width: 80%;
			}
			
			#detailTable2 td:nth-child(2) {
				text-align: left;
				width: 20%;
			}
			
			#detailTable3 {
				border-bottom: 1px solid #FBD188;
			}
			
			#textArea {
				border: 0;
				height: 400px;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<header>
            <jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
        </header>
        <main>
            <div id="detail-content">
                <table id="detailTable1">
                    <tr>
                        <td>${freeboard.boardHead }</td>
                        <td>${freeboard.boardTitle }</td>
                        <td>[닉네임]</td>
                        <td><div>${freeboard.boardCheck }</div></td>
                    </tr>
                </table>
                <table id="detailTable2">
                    <tr>
                        <td></td>
                        <td>${freeboard.writeDate } <a href="#">수정</a> | <a href="#">삭제</a></td>
                    </tr>
                </table>
                <table id="detailTable3">
                    <tr>
                        <input type="text" id="textArea" value="${freeboard.boardSubject }">
                            
                        </input>
                    </tr>
                </table>
            </div>
        </main>
        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
        </footer>
	</body>
</html>