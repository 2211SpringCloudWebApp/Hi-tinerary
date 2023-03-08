<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 생성 페이지</title>
	</head>
	<body>
		<main>
		<form action="/group/register.do" method="post">
			그룹명 : <input type="text" name="groupName">
			<div>
			시작날짜 : <input type="text" name="startDate">
			종료날짜 : <input type="text" name="endDate">
			</div>
			최대인원 : <input type="text" name="maxPeople">
			<div>
			<input type="submit"> <a href="#">321</a>
			</div>
		</form>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
</html>