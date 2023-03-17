<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>일반회원정보</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="./css/register.css"/>
    </head>
    <body>
        <main>
            <div id="register-area">
                <form action="/user/registerUser" method="post">
                    <div id="input-area">
                        <div class="info">
                            <label>아이디</label><span id=id-err class="err"></span><br>
                            <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
                        </div>
                        <div class="info">
                            <label>비밀번호</label><span id=pw-err class="err"></span><br>
                            <input type="password" id="userPw" name="userPw" value="${user.userPw}">
                        </div>
                        <div class="info">
                            <label>이름</label><span id=name-err class="err"></span><br>
                            <input type="text" id="userName" name="userName" value="${user.userName}" readonly>
                        </div>
                        <div class="info">
                            <label>닉네임</label><span id=nick-err class="err"></span><br>
                            <input type="text" id="userNickname" name="userNickname" value="${user.userNickname}">
                        </div>
                        <div class="info">
                            <label>이메일</label><span id=email-err class="err"></span><br>
                            <input type="text" id="userEmail" name="userEmail" class="mail-input" value="${emailId}">
                            <span> @ </span>
                            <input type="text" id="domain-input" name="domain-input" class="mail-input" value="${emailDomain}">
                                <select id="domain-select">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                        </div>
                        <div class="info">
                            <label>휴대폰번호</label><span id=phone-err class="err"></span><br>
                            <input type="text" id="userPhone" name="userPhone" value="${user.userPhone}" required onkeyup="addHyphenToPhoneNum(this)">
                        </div>
                        <div class="info">
                            <label>생년월일</label><span id=birth-err class="err"></span><br>
                            <input type="text" id="userBirthDate" name="userBirthDate" value="${user.userBirthDate}" readonly>
                        </div>
                        <div class="info">
                            <label>성별　</label><span id=gender-err class="err"></span><br>
                            남<input type="radio" id="userGender" name="userGender" value="남" <c:if test="${user.userGender eq '남'}">checked</c:if> disabled>
                            여<input type="radio" id="userGender" name="userGender" value="여" <c:if test="${user.userGender eq '여'}">checked</c:if> disabled>    
                        </div>
                        <br><br>
                        <div class="btn-area">
                            <input type="submit" value="수정하기" onclick="return Valid();">
                            <a href="/user/">
                            <input type="submit" value="탈퇴하기">
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
        <script>
            // select 요소와 input 요소 가져오기
            var domainSelect = document.getElementById("domain-select");
            var domainInput = document.getElementById("domain-input");
            // 도메인 select 요소값 변경될때
            domainSelect.addEventListener("change", function() {
            var selectedValue = domainSelect.value;  // 선택값 가져와서
            domainInput.value = selectedValue;  // input 요소값을 선택값으로 설정
            });

            // 전화번호 입력시 자동 하이픈
            function addHyphenToPhoneNum(input) {
                var phoneNum = input.value.replace(/[^0-9]/g, '');
                if (phoneNum.length === 9) {
                    phoneNum = phoneNum.replace(/(\d{2}|\d{3})(\d{3})(\d{3})/, '$1-$2-$3');
                } else if (phoneNum.length === 10) {
                    if (phoneNum.indexOf('02') === 0) {
                        phoneNum = phoneNum.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
                    } else {
                        phoneNum = phoneNum.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
                    }
                } else if (phoneNum.length === 11) {
                    phoneNum = phoneNum.replace(/(\d{3}|\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
                }
            input.value = phoneNum;  // 변환값 출력
            }

            // 유효성검사 
            // 비밀번호
            function checkPw() {
                var userPw = $("#userPw");
                var pwRegExp = /^[A-Za-z0-9]{8,12}$/;
                var pwErrTag = $("#pw-err"); 
                if(!pwRegExp.test(userPw.val())) {
                    pwErrTag.html("영문 대/소문자, 숫자 포함 8~12자 내로 입력하세요");
                    return false;
                } else {
                    pwErrTag.html("");
                    return true;
                }
            };
            // 닉네임
            function checkNickname() {
                var userNickname = $("#userNickname");
                var nickRegExp = /^.{2,12}$/;
                var nickErrTag = $("#nick-err");
                if(!nickRegExp.test(userNickname.val())) {
                    nickErrTag.html("2~12자 내로 입력하세요");
                    return false;
                } else {
                    nickErrTag.html("");
                    return true;
                }
            };
            // 이메일
            function checkEmail() {
                var userEmail = $("#userEmail");
                var emailRegExp = /^[a-z][a-z0-9_-]{4,20}$/;
                var emailErrTag = $("#email-err"); 
                if(!emailRegExp.test(userEmail.val())) {
                    emailErrTag.html("영문 소문자, 숫자, -, _ 포함 4~20자 내로 입력하세요");
                    return false;
                } else {
                    emailErrTag.html("");
                    return true;
                }
            };
            // 휴대폰번호
            function checkPhone() {
                var userPhone = $("#userPhone");
                var phoneRegExp = /^(01[016789]{1})[-][0-9]{3,4}[-][0-9]{4}$/;
                var phoneErrTag = $("#phone-err");
                if(!phoneRegExp.test(userPhone.val())) {
                    phoneErrTag.html("올바른 형식의 휴대폰번호를 입력하세요");
                    return false;
                } else {
                    phoneErrTag.html("");
                    return true;
                }
            };

            // 유효하지 않을시 submit 불가능
            function Valid(){
                var isValid = true;
                isValid = isValid && checkPw();
                isValid = isValid && checkNickname();
                isValid = isValid && checkEmail();
                isValid = isValid && checkPhone();
                if(isValid) {
                    alert("회원정보 수정이 완료되었습니다.");
                    return true;
                } else {
                    return false;
                }
                return isValid;
            };
        </script>
    </body>
</html>