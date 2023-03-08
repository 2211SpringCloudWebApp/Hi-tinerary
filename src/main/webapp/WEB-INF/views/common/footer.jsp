<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        p{
	            font-family: Pretendard-Regular;
	        }
	        footer {
	            border-top: 1px dashed #0F8D80;
	            height: 150px;
	            width : 1200px
	        }
	        #footer-logo{
	            float: left;
	            display : flex;
	            margin-top : 10px;
	            margin-left : 10px;
	        }
	        #footer1{
	            float: left;
	        }
	
	            #footer1 p:not(#first){
	                margin: 3px 0px;
	                font-size: 10px;
	            }
	        #footer3{
	            display : flex;
	            height: 15px;
	            width: 500px;
	            margin : 3px 0px;
	        }
	            #footer3 p{
	                padding-right: 10px;
	                height: 12px;
	            }
	            #footer3 p:not(:first-of-type){
	                border-left: 1px solid black;
	                padding-left : 10px;
	            }
	        #footer2{
	            float: right;
	        }
	            #footer2 p{
	                font-size: 10px;
	                margin : 3px 0px;
	            }
	        @font-face {
	            font-family: 'Pretendard-Regular';
	            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	            font-weight: 400;
	            font-style: normal;
	        }
	    </style>
	</head>
	<body>
	      <footer>
	        <div id="footer-logo">
	            <img id="footer-logo1" src="../../../resources/images/icon.png" alt="icon" width="30px" height="30px">
	            <img id="footer-logo2" src="../../../resources/images/logo.png" alt="logo" width="150px" height="30px">
	        </div>
	        <div id="footer1">
	            <p id="first"><b>이용약관/개인정보처리방침</b></p>
	            <div id="footer3">
	                <p>상호명 (주)쉽하네</p> <p>대표이사 : 최민준</p> <p>개인정보책임자 : 최민준</p>
	            </div>
	            <p>사업자등록번호 : 123-45-12347</p>
	            <p>본사 : 서울특별시 중구 남대문로 120 대일빌딩 3층</p>
	            <p>대표전화 : 02-303-1041</p>
	        </div>
	        <div id="footer2">
	            <p>hi-tinerary는 통신판매중계사이며 통신판매의 당사자가 아닙니다.</p>
	            <p>따라서 hi-tinerary은 상품-거래 정보 및 가격에 대하여 책임을 지지 않습니다.</p>
	        </div>
	      </footer>
	</body>
</html>