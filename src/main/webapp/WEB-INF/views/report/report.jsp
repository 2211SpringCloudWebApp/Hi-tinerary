<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>신고 페이지</title>
		<link rel="stylesheet" href="../../../resources/css/report.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<div id="container">
            <header>
				<jsp:include page="/WEB-INF/views/common/headerNav.jsp"></jsp:include>
            </header>
            <main>
                <table id="reportTable">
                    <tr>
                        <td id="selectTd">
                            <select name="" id="reportSelect">
                                <option value="0" selected>신고사유</option>
                                <option value="1" >스팸홍보/도배글입니다.</option>
                                <option value="2" >음란물입니다.</option>
                                <option value="3" >불법정보를 포함하고 있습니다.</option>
                                <option value="4" >청소년에게 유해한 내용입니다.</option>
                                <option value="5" >욕설/생명경시/혐오/차별적 표현입니다.</option>
                                <option value="6" >개인정보 노출 게시물입니다.</option>
                                <option value="7" >불쾌한 표현이 있습니다.</option>
                            </select>
                        </td>
                        <td id="titleTd">
                            [글제목가져오기]
                        </td>
                        <td id="nicknameTd">
                            [닉네임]
                        </td>
                    </tr>
                    <tr>
                        <td id="subjectTd" colspan="3">
                            <span id="reportSpan1">
                                . 적절한 신고 사유를 선택해주세요.
                            </span>
                            <span id="reportSpan2">
                                . 사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보 행위<br>
	                            . 동일하거나 유사한 내용 반복 게시
                            </span>
                            <span id="reportSpan3">
                                . 성적 수치심을 일으키는 내용<br>
	                            . 아동이나 청소년을 성 대상화한 표현<br>
	                            . 과도하거나 의도적인 신체 노출<br>
	                            . 음란한 행위와 관련된 부적절한 내용
                            </span>
                            <span id="reportSpan4">
                                . 불법 행위, 불법 링크에 대한 정보 제공<br>
	                            . 불법 상품을 판매하거나 유도하는 내용
                            </span>
                            <span id="reportSpan5">
                                . 가출/왕따/학교폭력/자살 등 청소년에게 부정적인 영향을 조성하는 내용
                            </span>
                            <span id="reportSpan6">
                                . 직·간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용<br>
	                            . 생명을 경시여기거나 비하하는 내용<br>
	                            . 계층/지역/종교/성별 등을 혐오하거나 비하하는 표현<br>
	                            . 신체/외모/취향 등을 경멸하는 표현
                            </span>
                            <span id="reportSpan7">
                                . 법적으로 중요한 타인의 개인정보를 게재<br>
	                            . 당사자 동의 없는 특정 개인을 인지할 수 있는 정보
                            </span>
                            <span id="reportSpan8">
                                . 불쾌한 표현 포함 (해당 사유는 클린봇 학습에 도움이 될 수 있습니다.)
                            </span>
                        </td>
                    </tr>
                </table>
                <table id="reportButtonTable">
                    <tr>
                        <td>
                        	<form id="reportForm" action="/clickReport" method="GET">
                        		<input type="hidden" name="boardType" value="free">
								<input type="hidden" name="boardNo" value="${boardNo}">
                            	<button type="submit" id="reportButton">
                                	신고하기
                            	</button>
                            </form>
                            <form action="/rollbackView" method="GET">
                            	<input type="hidden" name="boardType" value="free">
								<input type="hidden" name="boardNo" value="${boardNo}">
                            	<button type="submit" id="gobackButton">
                                	뒤로가기
                            	</button>
                            </form>
                        </td>
                    </tr>
                </table>
                <script>
                    $(document).ready(function() {
                        // 기본적으로 스팬태그를 모두 숨깁니다.
                        $('#reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();

                        // 셀렉트 옵션 값이 변경될 때마다 해당하는 스팬태그를 보여줍니다.
                        $('#reportSelect').on('change', function() {
                            var optionSelected = $(this).find("option:selected");
                            var valueSelected = optionSelected.val();

                            // 선택된 옵션값에 해당하는 스팬태그만 보여주고 나머지는 숨깁니다.
                            switch (valueSelected) {
                            case "0":
                                $('#reportSpan1').show();
                                $('#reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "1":
                                $('#reportSpan2').show();
                                $('#reportSpan1, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "2":
                                $('#reportSpan3').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "3":
                                $('#reportSpan4').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "4":
                                $('#reportSpan5').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan4, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "5":
                                $('#reportSpan6').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan7, #reportSpan8').hide();
                                break;
                            case "6":
                                $('#reportSpan7').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan8').hide();
                                break;
                            case "7":
                                $('#reportSpan8').show();
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7').hide();
                                break;
                            default:
                                $('#reportSpan1, #reportSpan2, #reportSpan3, #reportSpan4, #reportSpan5, #reportSpan6, #reportSpan7, #reportSpan8').hide();
                                break;
                            }
                        });
                    });
                    
					// form 데이터에 선택된 옵션의 값을 추가하여 전송하는 함수
	                function submitForm() {
	                	var form = document.getElementById("reportForm");
	                	var selectBox = document.getElementById("reportSelect");
	                	var selectedOption = selectBox.options[selectBox.selectedIndex];
	                	var reportReason = selectedOption.value;

	
	                	// form 데이터에 reportReason 추가
	                	var reportReasonInput = document.createElement("input");
	                	reportReasonInput.setAttribute("type", "hidden");
	                	reportReasonInput.setAttribute("name", "reportReason");
	                	reportReasonInput.setAttribute("value", reportReason);
	                	form.appendChild(reportReasonInput);
	
	                    // form 전송
	                	form.submit();
	                }
	
	                // 버튼 클릭 시 submitForm 함수 호출
	                var reportButton = document.getElementById("reportButton");
					reportButton.addEventListener("click", submitForm);	
                </script>
            </main>
            <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            </footer>
        </div>
	</body>
</html>