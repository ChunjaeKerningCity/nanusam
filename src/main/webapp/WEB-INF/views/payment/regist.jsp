<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp"/>
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp"/>
    <style>
        /* 전체 폼을 감싸는 컨테이너 */
        form {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            font-size: 2rem;
            color: #333;
            margin-bottom: 1.5rem;
        }

        /* 폼 필드셋 스타일 */
        fieldset {
            border: 1px solid #ddd;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        legend {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            padding: 0 10px;
        }

        /* 레이블 스타일 */
        label {
            display: block;
            font-size: 1rem;
            margin-bottom: 0.5rem;
            color: #555;
        }

        /* 입력 필드 스타일 */
        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="button"],
        select {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        /* 오류 메시지 영역 */
        div[id^="div_err_"] {
            color: red;
            font-size: 0.875rem;
            display: none;
            margin-top: 0.5rem;
        }

    </style>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8"/>
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8"/>
</header>
<div class="line"></div>
<main>
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <h1>주문 정보 입력</h1>

            <%--상품정보넣기--%>

            <form method="post" id="frmPaymentRegist" action="/payment/regist.do?goodsIdx=${goodsInfo.idx}">

                <!-- 주문자 정보 입력 -->
                <fieldset>
                    <legend>주문자 정보</legend>

                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" required>
                    <div id="div_err_name" style="display: none;"></div>
                    <br>

                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone" pattern="^\d{3}\d{3,4}\d{4}$" placeholder="01012345678"
                           required>
                    <div id="div_err_phone" style="display: none;"></div>
                    <br>

                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" value="${item.email}">
                    <div id="div_err_email" style="display: none;"></div>
                    <br>

                    <label for="zipCode">우편번호</label>
                    <input type="text" id="zipCode" name="zipCode" readonly required value="${item.zipCode}">
                    <div id="div_err_zipCode" style="display: none;"></div>
                    <button class="button confirmBtn" style="margin-bottom: 20px" onclick="goZip(); return false;">우편번호 찾기</button>
                    <br>

                    <label for="addr1">주소</label>
                    <input type="text" id="addr1" name="addr1" readonly required value="${item.addr1}">
                    <div id="div_err_addr1" style="display: none;"></div>
                    <br>

                    <label for="addr2">상세 주소</label>
                    <input type="text" id="addr2" name="addr2" required value="${item.addr2}">
                    <div id="div_err_addr2" style="display: none;"></div>
                    <br>
                </fieldset>

                <br>

                <!-- 결제 정보 입력 -->
                <fieldset>
                    <legend>결제 정보</legend>

                    <label for="method">결제수단:</label>
                    <select id="method" name="method">
                        <option value="신용카드" ${item.method=='신용카드'?'selected':''}>신용카드</option>
                        <option value="체크카드" ${item.method=='체크카드'?'selected':''}>체크카드</option>
                        <option value="페이팔" ${item.method=='페이팔'?'selected':''}>페이팔</option>
                        <option value="은행이체" ${item.method=='은행이체'?'selected':''}>은행이체</option>
                    </select>
                    <div id="div_err_method" style="display: none;"></div>
                    <br>

                    <label for="paymentCompany">결제회사:</label>
                    <input type="text" id="paymentCompany" name="paymentCompany" value="${item.paymentCompany}">
                    <div id="div_err_paymentCompany" style="display: none;"></div>
                    <br>

                    <label for="paymentNo">결제번호:</label>
                    <input type="text" id="paymentNo" name="paymentNo" value="${item.paymentNo}">
                    <div id="div_err_paymentNo" style="display: none;"></div>
                    <br>
                </fieldset>

                <br>

                <!-- 제출 버튼 -->
                <input class="button confirmBtn" type="submit" value="결제">
            </form>
        </div>
        <div class="commonRight">
            <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
        </div>
    </div>
</main>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function goZip() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ""; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraRoadAddr +=
                        extraRoadAddr !== ""
                            ? ", " + data.buildingName
                            : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== "") {
                    extraRoadAddr = " (" + extraRoadAddr + ")";
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipCode").value = data.zonecode;
                document.getElementById("addr1").value = roadAddr;
            },
        }).open();
    }
</script>
<script>
    const svrValidateResult = {};
    <c:forEach items="${formerrors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        console.log("1");
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red;'>" + "${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    svrValidateResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>