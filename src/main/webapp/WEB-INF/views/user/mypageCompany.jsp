<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기업회원 마이페이지</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="../../../../resources/css/mypage.css">
    </head>
    <body>
    	<header>
    		<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
    	</header>
        <main>
			<div class="container">
				<div class="side-nav">
					<h3>${loginUser.userNickname} 님</h3>
		            <a href="/user/mypageCompany" class="nav-btn nownav">내 정보 조회</a>
		            <a href="/company/mypage/selllist" class="nav-btn">판매내역 조회</a>
		            <a href="/company/mypage/write/post" class="nav-btn">작성 글 조회</a>
		            <a href="/company/mypage/write/comment" class="nav-btn">작성 댓글 조회</a>
		        </div>
		        <div id="mypage-contentbox">
		            <div id="mypage-title">
		                <h2>내 정보 조회</h2>
		            </div>
		            <div id="mypage-content">
		                <form action="/company/modifyInfo" method="post">
		                    <div id="input-area">
		                			<input type="hidden" name="userNo" value="${user.userNo }">
		                        <div class="info">
		                            <label>아이디</label><span id=id-err class="err"></span><br>
		                            <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
		                        </div>
		                        <div class="info">
		                            <label>비밀번호</label><span id=pw-err class="err"></span><br>
		                            <input type="password" id="userPw" name="userPw">
		                        </div>
		                        <div class="info">
		                            <label>대표자명</label><span id=name-err class="err"></span><br>
		                            <input type="text" id="userName" name="userName" value="${user.userName}">
		                        </div>
		                        <div class="info">
		                            <label>상호명(법인명)</label><span id=nick-err class="err"></span><br>
		                            <input type="text" id="userNickname" name="userNickname" value="${user.userNickname}">
		                        </div>
		                        <div class="info">
		                            <label>이메일</label><span id=email-err class="err"></span><br>
		                            <input type="text" id="userEmail" name="userEmail" class="mail-input form-mailid" value="${user.userEmail}">
		                            <span> @ </span>
		                            <input type="text" id="domain-input" name="domain-input" class="mail-input form-domain" value="${domain}">
		                                <select id="domain-select" class="form-damain-select">
		                                    <option value="">직접입력</option>
		                                    <option value="naver.com">naver.com</option>
		                                    <option value="gmail.com">gmail.com</option>
		                                    <option value="daum.net">daum.net</option>
		                                    <option value="nate.com">nate.com</option>
		                                </select>
		                        </div>
		                        <div class="info">
		                            <label>전화번호</label><span id=phone-err class="err"></span><br>
		                            <input type="text" id="userPhone" name="userPhone" value="${user.userPhone}" required onkeyup="addHyphenToPhoneNum(this)">
		                        </div>
		                        <div class="info">
		                            <label>개업연월일</label><span id=birth-err class="err"></span><br>
		                            <input type="text" id="userBirthDate" name="userBirthDate" value="${user.userBirthDate}">
		                        </div>
		                        <div class="info">
		                            <label>사업자등록번호</label><span id=regi-err class="err"></span><br>
		                            <input type="text" id="companyRegiNo" name="companyRegiNo" value="${user.companyRegiNo}" onkeyup="addHyphenToRegiNo(this)">
		                        </div>
		        			</div>
							<br>
		                    <div class="btn-area">
		                    	<input type="submit" value="수정하기">
		                    </div>
		                </form>
		                <form action="/company/deleteApply" method="post">
		                	<div class="btn-area">
		                		<input type="hidden" name="userNo" value="${loginUser.userNo }">
		                        <input type="submit" value="탈퇴신청">
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
        </main>
        <footer>
        	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 
        </footer>
        <script>
/*             // select 요소와 input 요소 가져오기
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

            // 유효하지 않을시 submit 불가능
            function Valid(){
                var isValid = true;
                isValid = isValid && checkPw();
                isValid = isValid && checkName();
                isValid = isValid && checkNickname();
                isValid = isValid && checkEmail();
                isValid = isValid && checkPhone();
                isValid = isValid && checkBirthDate();
                isValid = isValid && checkcompanyRegiNo();
                if(isValid) {
                    alert("회원정보 수정이 완료되었습니다.");
                    return true;
                } else {
                    return false;
                }
                return isValid;
            }; */
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