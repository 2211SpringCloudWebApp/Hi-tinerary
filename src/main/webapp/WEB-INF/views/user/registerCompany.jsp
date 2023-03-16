<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>기업회원가입</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="${path }../../../resources/css/register.css"/>
    </head>
    <body>
        <main>
            <div id="register-area">
                <h2>기업회원</h2><br><br>
                <form action="/user/registerCompany" method="post">
                    <div id="input-area">
                        <div class="info">
                            <label>아이디</label><span id=id-err class="err"></span><br>
                            <input type="text" id="userId" name="userId" required>
                        </div>
                        <div class="info">
                            <label>비밀번호</label><span id=pw-err class="err"></span><br>
                            <input type="password" id="userPw" name="userPw" required>
                        </div>
                        <div class="info">
                            <label>대표자명</label><span id=name-err class="err"></span><br>
                            <input type="text" id="userName" name="userName" required>
                        </div>
                        <div class="info">
                            <label>상호명(법인명)</label><span id=nick-err class="err"></span><br>
                            <input type="text" id="userNickname" name="userNickname" required>
                        </div>
                        <div class="info">
                            <label>이메일</label><span id=email-err class="err"></span><br>
                            <input type="text" id="userEmail" name="userEmail" class="mail-input" required>
                            <span> @ </span>
                            <input type="text" id="domain-input" name="domain-input" class="mail-input" value="" required>
                                <select id="domain-select">
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                        </div>
                        <div class="info">
                            <label>전화번호</label><span id=phone-err class="err"></span><br>
                            <input type="text" id="userPhone" name="userPhone" placeholder="'-'없이 숫자만 입력" required onkeyup="addHyphenToPhoneNum(this)">
                        </div>
                        <div class="info">
                            <label>개업연월일</label><span id=birth-err class="err"></span><br>
                            <input type="text" id="userBirthDate" name="userBirthDate" placeholder="예 : 2001/01/01의 경우 '010101'로 입력" required>
                        </div>
                        <div class="info">
                            <label>사업자등록번호</label><span id=regi-err class="err"></span><br>
                            <input type="text" id="companyRegiNo" name="companyRegiNo" placeholder="'-'없이 숫자만 입력" required onkeyup="addHyphenToRegiNo(this)">
                        </div>
                        <div class="info">
                            <input type="hidden" name="userGrade" value="1">
                        </div>
                        <br><br>
                        <div class="btn-area">
                            <input type="submit" value="회원가입" onclick="return Valid();">
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

            // 사업자등록번호 입력시 자동 하이픈
            function addHyphenToRegiNo(input) {
                var regiNo = input.value.replace(/[^0-9]/g, '');
                if (regiNo.length === 10) {
                    regiNo = regiNo.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
                }
            input.value = regiNo;  // 변환값 출력
            }

            // 유효성검사 
            // 아이디
            function checkId() {
                var userId = $("#userId");
                var idRegExp = /^[a-z][a-z0-9]{3,12}$/;
                var idErrTag = $("#id-err"); 
                if(!idRegExp.test(userId.val())) {
                    idErrTag.html("영문소문자, 숫자 포함 4~12자 내로 입력하세요");
                    return false;
                } else {
                    idErrTag.html("");
                    return true;
                }
            };
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
            // 대표자명
            function checkName() {
                var userName = $("#userName");
                var nameRegExp = /^[가-힣]{2,8}$/;
                var nameErrTag = $("#name-err"); 
                if(!nameRegExp.test(userName.val())) {
                    nameErrTag.html("한글(최소 2자 이상)만 입력 가능합니다");
                    return false;
                } else {
                    nameErrTag.html("");
                    return true;
                }
            };
            // 상호명(법인명)
            function checkNickname() {
                var userNickname = $("#userNickname");
                var nickRegExp = /^.{2,12}$/;
                var nickErrTag = $("#nick-err");
                if(!nickRegExp.test(userNickname.val())) {
                    nickErrTag.html("2~12자 내로 입력하세요.");
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
                    emailErrTag.html("영문 소문자, 숫자, -, _ 포함 4~20자 내로 입력하세요.");
                    return false;
                } else {
                    emailErrTag.html("");
                    return true;
                }
            };
            // 전화번호
            function checkPhone() {
                var userPhone = $("#userPhone");
                var phoneRegExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[-][0-9]{3,4}[-][0-9]{4}$/;
                var phoneErrTag = $("#phone-err");
                if(!phoneRegExp.test(userPhone.val())) {
                    phoneErrTag.html("올바른 형식의 전화번호를 입력하세요");
                    return false;
                } else {
                    phoneErrTag.html("");
                    return true;
                }
            };
            // 개업연월일
            function checkBirthDate() {
                var userBirthDate = $("#userBirthDate");
                var birthRegExp = /^(\d{2})([0-1]\d|[2][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
                var birthErrTag = $("#birth-err");
                if(!birthRegExp.test(userBirthDate.val())) {
                    birthErrTag.html("연도 앞 2자리를 제외한 6자리 형태로 입력하세요");
                    return false;
                } else {
                    birthErrTag.html("");
                    return true;
                }
            };
            // 사업자등록번호
            function checkcompanyRegiNo() {
                var companyRegiNo = $("#companyRegiNo");
                var regiRegExp = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
                var regiErrTag = $("#regi-err");
                if(!regiRegExp.test(companyRegiNo.val())) {
                    regiErrTag.html("올바른 형식의 사업자등록번호를 입력하세요");
                    return false;
                } else {
                    regiErrTag.html("");
                    return true;
                }
            };
            
            // 입력화면 오류메세지
            $(document).ready(function() {
                // 아이디
                $("#userId").blur(function() {
                    checkId();
                });
                // 비밀번호
                $("#userPw").keyup(function() {
                    checkPw();
                });
                // 대표자명
                $("#userName").blur(function() {
                    checkName();
                });
                // 상호명(법인명)
                $("#userNickname").blur(function() {
                    checkNickname();
                });
                // 이메일
                $("#userEmail").blur(function() {
                    checkEmail();
                });
                // 전화번호
                $("#userPhone").blur(function() {
                    checkPhone();
                });
                // 개업연월일
                $("#userBirthDate").blur(function() {
                    checkBirthDate();
                });
                // 사업자등록번호
                $("#companyRegiNo").blur(function() {
                    checkcompanyRegiNo();
                });
            });

            // 유효하지 않을시 submit 불가능
            function Valid(){
                var isValid = true;
                isValid = isValid && checkId();
                isValid = isValid && checkPw();
                isValid = isValid && checkName();
                isValid = isValid && checkNickname();
                isValid = isValid && checkEmail();
                isValid = isValid && checkPhone();
                isValid = isValid && checkBirthDate();
                isValid = isValid && checkcompanyRegiNo();
                if(isValid) {
                    alert("Hi-tinerary의 회원이 되신걸 환영합니다!\n로그인 후 당신만의 여정을 시작해보세요 : )");
                    return true;
                } else {
                    return false;
                }
                return isValid;
            };
        </script>
    </body>
</html>