<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이 페이지</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="../../../../resources/css/usermypage.css">
        <link rel="icon" href="../../../../resources/images/icon.ico" type="image/x-icon">
    </head>
    <body>
    	<header>
    		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
    	</header>
        <main>
		     <div class="mypage-container">
		        <div class="mypage-navbox">
		            <p class="nav-content">${loginUser.userNickname} 님</p>
		            <a href="/user/mypage" class="nav-btn nownav">내 정보 조회</a>
		            <a href="/user/mypage/buylist" class="nav-btn">상품 구매내역 조회</a>
		            <a href="/user/mypage/write/withboard" class="nav-btn">작성 글 조회</a>
		            <a href="/user/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		            <a href="/group/groupinfopage" class="nav-btn">그룹 페이지</a>
		        </div>
		        <div class="mypage-contentbox">
		            <div class="mypage-title">
		                <p>내정보 조회</p>
		            </div>
		            <div class="mypage-content">
		                <p class="form-title">[일반]내 정보 조회</p>
		                <form action="/user/modify" method="post">
		                	<input type="hidden" name="userNo" value="${user.userNo }">
		                    <label for="id">아이디</label>
		                    <input type="text" value="${user.userId }" readonly class="form-text" id="id">
		                    <label for="pw">비밀번호</label>
		                    <input type="password" name="userPw" class="form-text" id="pw">
		                    <label for="nickname">닉네임</label>
		                    <input type="text" name="userNickname" value="${user.userNickname }" class="form-text" id="nickname">
		                    <label for="email">메일주소</label>
		                    <div class="email-box">
		              	    	<input type="text" value="${user.userEmail }" name="mailId" class="form-mailid">@
			                    <input type="text" class="form-domain" value="${domain }" name="mailDomain">
			                    <select class="form-damain-select">
			                    	<option value="">직접입력
			                    	<option value="naver.com">naver.com
			                    	<option value="gmail.com">gmail.com
			                    	<option value="daum.net">daum.net
			                    	<option value="nate.com">nate.com
			                    </select>
		                    </div>
		                    <label for="phone">전화번호</label>
		                    <input type="text" name="userPhone" value="${user.userPhone }" class="form-text" id="phone">
		                    <label for="birthdate">생년월일</label>
		                    <input type="text" value="${user.userBirthDate }"class="form-text" id="birthdate" readonly>
		                    <div class="radio-box">
		                        여자<input type="radio" <c:if test="${user.userGender == '여' }">checked="checked"</c:if> disabled="disabled" name="gender">
		                        남자<input type="radio" <c:if test="${user.userGender == '남' }">checked="checked"</c:if> disabled="disabled" name="gender">
		                    </div>
		                    <input type="submit" class="form-btn" value="수정하기">
		                </form>
		                <form action="/user/delete" method="post">
		                    <input type="hidden" name="userNo" value="${loginUser.userNo }">
		                    <input type="submit" class="form-btn withdraw" value="탈퇴하기">
		                </form>
		            </div>
		        </div>
		    </div>
        </main>
        <footer>
        	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 
        </footer>
        <script>
//             // select 요소와 input 요소 가져오기
//             var domainSelect = document.getElementById("domain-select");
//             var domainInput = document.getElementById("domain-input");
//             // 도메인 select 요소값 변경될때
//             domainSelect.addEventListener("change", function() {
//             var selectedValue = domainSelect.value;  // 선택값 가져와서
//             domainInput.value = selectedValue;  // input 요소값을 선택값으로 설정
//             });

//             // 전화번호 입력시 자동 하이픈
//             function addHyphenToPhoneNum(input) {
//             	var phoneNumber = input.value.replace(/[^0-9]/g, '');
//             	if (phoneNumber.length === 9) {
//                 	phoneNumber = phoneNumber.replace(/(\d{2}|\d{3})(\d{3})(\d{3})/, '$1-$2-$3');
//             	} else if (phoneNumber.length === 10) {
//                 	if (phoneNumber.indexOf('02') === 0) {
//                     	phoneNumber = phoneNumber.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
//                 	} else {
//                     	phoneNumber = phoneNumber.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
//                 	}
//             	} else if (phoneNumber.length === 11) {
//                 	phoneNumber = phoneNumber.replace(/(\d{3}|\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
//             	}
//             input.value = phoneNumber;  // 변환값 출력
//             }

//             // 유효성검사 
//             // 아이디
//             function checkId() {
//                 var userId = $("#userId");
//                 var idRegExp = /^[a-z][a-z0-9]{3,12}$/;
//                 var idErrTag = $("#id-err"); 
//                 if(!idRegExp.test(userId.val())) {
//                     idErrTag.html("영문소문자, 숫자 포함 4~12자 내로 입력하세요");
//                     return false;
//                 } else {
//                     idErrTag.html("");
//                     return true;
//                 }
//             };
//             // 비밀번호
//             function checkPw() {
//                 var userPw = $("#userPw");
//                 var pwRegExp = /^[A-Za-z0-9]{8,12}$/;
//                 var pwErrTag = $("#pw-err"); 
//                 if(!pwRegExp.test(userPw.val())) {
//                     pwErrTag.html("영문 대/소문자, 숫자 포함 8~12자 내로 입력하세요");
//                     return false;
//                 } else {
//                     pwErrTag.html("");
//                     return true;
//                 }
//             };
//             // 이름
//             function checkName() {
//                 var userName = $("#userName");
//                 var nameRegExp = /^[가-힣]{2,8}$/;
//                 var nameErrTag = $("#name-err"); 
//                 if(!nameRegExp.test(userName.val())) {
//                     nameErrTag.html("한글(최소 2자 이상)만 입력 가능합니다");
//                     return false;
//                 } else {
//                     nameErrTag.html("");
//                     return true;
//                 }
//             };
//             // 닉네임
//             function checkNickname() {
//                 var userNickname = $("#userNickname");
//                 var nickRegExp = /^.{2,12}$/;
//                 var nickErrTag = $("#nick-err");
//                 if(!nickRegExp.test(userNickname.val())) {
//                     nickErrTag.html("2~12자 내로 입력하세요");
//                     return false;
//                 } else {
//                     nickErrTag.html("");
//                     return true;
//                 }
//             };
//             // 이메일
//             function checkEmail() {
//                 var userEmail = $("#userEmail");
//                 var emailRegExp = /^[a-z][a-z0-9_-]{4,20}$/;
//                 var emailErrTag = $("#email-err"); 
//                 if(!emailRegExp.test(userEmail.val())) {
//                     emailErrTag.html("영문 소문자, 숫자, -, _ 포함 4~20자 내로 입력하세요");
//                     return false;
//                 } else {
//                     emailErrTag.html("");
//                     return true;
//                 }
//             };
//             // 휴대폰번호
//             function checkPhone() {
//                 var userPhone = $("#userPhone");
//                 var phoneRegExp = /^(01[016789]{1})[-][0-9]{3,4}[-][0-9]{4}$/;
//                 var phoneErrTag = $("#phone-err");
//                 if(!phoneRegExp.test(userPhone.val())) {
//                     phoneErrTag.html("올바른 형식의 휴대폰번호를 입력하세요");
//                     return false;
//                 } else {
//                     phoneErrTag.html("");
//                     return true;
//                 }
//             };
//             // 생년월일
//             function checkBirthDate() {
//                 var userBirthDate = $("#userBirthDate");
//                 var birthRegExp = /^(\d{2})([0-1]\d|[2][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
//                 var birthErrTag = $("#birth-err");
//                 if(!birthRegExp.test(userBirthDate.val())) {
//                     birthErrTag.html("주민등록번호 앞 6자리 형태로 입력하세요");
//                     return false;
//                 } else {
//                     birthErrTag.html("");
//                     return true;
//                 }
//             };
//             // 성별
//             function checkGender() {
//                 var userGender = $("input[name=userGender]:checked").val();
//                 var genderErrTag = $("#gender-err");
//                 if (!userGender) {
//                     genderErrTag.html("성별을 선택해 주세요");
//                     return false;
//                 } else {
//                     genderErrTag.html("");
//                     return true;
//                 }
//             };
            
//             // 입력화면 오류메세지
//             $(document).ready(function() {
//                 // 아이디
//                 $("#userId").blur(function() {
//                     checkId();
//                 });
//                 // 비밀번호
//                 $("#userPw").keyup(function() {
//                     checkPw();
//                 });
//                 // 이름
//                 $("#userName").blur(function() {
//                     checkName();
//                 });
//                 // 닉네임
//                 $("#userNickname").blur(function() {
//                     checkNickname();
//                 });
//                 // 이메일
//                 $("#userEmail").blur(function() {
//                     checkEmail();
//                 });
//                 // 휴대폰번호
//                 $("#userPhone").blur(function() {
//                     checkPhone();
//                 });
//                 // 생년월일
//                 $("#userBirthDate").blur(function() {
//                     checkBirthDate();
//                 });
//             });

//             // 유효하지 않을시 submit 불가능
//             function Valid(){
//                 var isValid = true;
//                 isValid = isValid && checkId();
//                 isValid = isValid && checkPw();
//                 isValid = isValid && checkName();
//                 isValid = isValid && checkNickname();
//                 isValid = isValid && checkEmail();
//                 isValid = isValid && checkPhone();
//                 isValid = isValid && checkBirthDate();
//                 isValid = isValid && checkGender();
//                 if(isValid) {
//                     alert("Hi-tinerary의 회원이 되신걸 환영합니다!\n로그인 후 당신만의 여정을 시작해보세요 : )");
//                     return true;
//                 } else {
//                     return false;
//                 }
//                 return isValid;
//             };
            let selectBox = document.querySelector(".form-damain-select");
            let domainBox = document.querySelector(".form-domain");
           	let a = document.querySelectorAll("[value='${domain}']")[1];
           	if(a != null){
           		a.selected = true;
           		domainBox.readOnly = true;
           	}
            selectBox.addEventListener("change", function(){
            	if(selectBox.value == ""){
            		domainBox.readOnly = false;
            	}else{
            		domainBox.readOnly = true;
            	}
            		domainBox.value = selectBox.value            		
            })
          </script>
     </body>
</html>