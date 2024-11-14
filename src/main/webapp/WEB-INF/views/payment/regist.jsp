<%--
  Created by IntelliJ IDEA.
  User: full5-2
  Date: 2024-11-13
  Time: 오후 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>payment</title>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<h1>주문 정보 입력</h1>

<%--상품정보넣기--%>

<form method="post" action="/payment/regist.do?goodsIdx=${item.idx}">

    <!-- 주문자 정보 입력 -->
    <fieldset>
        <legend>주문자 정보</legend>

        <label for="name">이름</label>
        <input type="text" id="name" name="name" required>
        <div id="div_err_name" style="display: none;"></div>
        <br>

        <label for="phone">전화번호</label>
        <input type="tel" id="phone" name="phone" pattern="^\d{3}\d{3,4}\d{4}$" placeholder="010-1234-5678" required>
        <div id="div_err_phone" style="display: none;"></div>
        <br>

        <label for="email">이메일</label>
        <input type="email" id="email" name="email">
        <div id="div_err_email" style="display: none;"></div>
        <br>

        <label for="zipCode">우편번호</label>
        <input type="text" id="zipCode" name="zipCode" readonly  required>
        <div id="div_err_zipCode" style="display: none;"></div>
        <input  type="button" onclick="goZip()" value="우편번호 찾기" />
        <br>

        <label for="addr1">주소</label>
        <input type="text" id="addr1" name="addr1" readonly required>
        <div id="div_err_addr1" style="display: none;"></div>
        <br>

        <label for="addr2">상세 주소</label>
        <input type="text" id="addr2" name="addr2" required>
        <div id="div_err_addr2" style="display: none;"></div>
        <br>
    </fieldset>

    <br>

    <!-- 결제 정보 입력 -->
    <fieldset>
        <legend>결제 정보</legend>

        <label for="method">결제수단:</label>
        <select id="method" name="method">
            <option value="creditCard">신용카드</option>
            <option value="debitCard">체크카드</option>
            <option value="paypal">페이팔</option>
            <option value="bankTransfer">은행이체</option>
        </select>
        <div id="div_err_method" style="display: none;"></div>
        <br>

        <label for="paymentCompany">결제회사:</label>
        <input type="text" id="paymentCompany" name="paymentCompany">
        <div id="div_err_paymentCompany" style="display: none;"></div>
        <br>

        <label for="paymentNo">결제번호:</label>
        <input type="text" id="paymentNo" name="paymentNo">
        <div id="div_err_paymentNo" style="display: none;"></div>
        <br>
    </fieldset>

    <br>

    <!-- 제출 버튼 -->
    <input type="submit" value="결제"></input>
</form>

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
    if(document.getElementById("div_err_${err.getField()}") != null) {
        console.log("1");
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red;'>"+"${err.getField()} 필드는 ${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    svrValidateResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
</body>
</html>
