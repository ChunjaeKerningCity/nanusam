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
<h1>주문 정보 입력</h1>

<form method="post" action="/submitOrder">

    <!-- 주문자 정보 입력 -->
    <fieldset>
        <legend>주문자 정보</legend>

        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
        <br>

        <label for="phone">전화번호:</label>
        <input type="tel" id="phone" name="phone" pattern="^\d{3}-\d{3,4}-\d{4}$" placeholder="010-1234-5678" required>
        <br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
        <br>

        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required>
        <br>

        <label for="postalCode">우편번호:</label>
        <input type="text" id="postalCode" name="postalCode" pattern="\d{5}" placeholder="우편번호 5자리" required>
        <br>
    </fieldset>

    <br>

    <!-- 결제 정보 입력 -->
    <fieldset>
        <legend>결제 정보</legend>

        <label for="paymentMethod">결제수단:</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="creditCard">신용카드</option>
            <option value="debitCard">체크카드</option>
            <option value="paypal">페이팔</option>
            <option value="bankTransfer">은행이체</option>
        </select>
        <br>

        <label for="paymentCompany">결제회사:</label>
        <input type="text" id="paymentCompany" name="paymentCompany" required>
        <br>

        <label for="paymentNumber">결제번호:</label>
        <input type="text" id="paymentNumber" name="paymentNumber" required>
        <br>
    </fieldset>

    <br>

    <!-- 제출 버튼 -->
    <button type="submit">주문 제출</button>
</form>
</body>
</html>
