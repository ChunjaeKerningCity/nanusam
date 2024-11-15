<%--
  Created by IntelliJ IDEA.
  User: full5-2
  Date: 2024-11-14
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>payment-view</title>
</head>
<%--상품정보--%>
<h3>상품정보</h3>
<table>
    <tr>
        <td rowspan="4"><img src="/resources/image/goods_${item.goodsInfo.idx}_0.png"></td>
        <th>판매자</th>
        <td>${item.seller}</td>
    </tr>
    <tr>
        <th>카테고리</th>
        <td>${item.goodsInfo.category}</td>
    </tr>
    <tr>
        <th>상품명</th>
        <td>${item.goodsInfo.name}</td>
    </tr>
    <tr>
        <th>가격</th>
        <td>${item.goodsInfo.price}</td>
    </tr>
</table>

<%--결제정보--%>
<h3>결제 정보</h3>
<table>
    <tr>
        <th>결제일자</th>
        <td>${item.payDateStr}</td>
    </tr>
    <tr>
        <th>결제수단</th>
        <td>${item.method}</td>
    </tr>
    <tr>
        <th>결제회사</th>
        <td>${item.paymentCompany}</td>
    </tr>
    <tr>
        <th>결제번호</th>
        <td>${item.paymentNo}</td>
    </tr>
</table>

<h3>배송 정보</h3>
<table>
    <tr>
        <th>구매자</th>
        <td>${item.buyer}</td>
    </tr>
    <tr>
        <th>주문자 이름</th>
        <td>${item.name}</td>
    </tr>
    <tr>
        <th>이메일</th>
        <td>${item.email}</td>
    </tr>
    <tr>
        <th>휴대폰</th>
        <td>${item.phone}</td>
    </tr>
    <tr>
        <th>주소</th>
        <td>${item.addr1}</td>
    </tr>
    <tr>
        <th>상세주소</th>
        <td>${item.addr2}</td>
    </tr>
    <tr>
        <th>우편번호</th>
        <td>${item.zipCode}</td>
    </tr>
    <tr>
        <th>배송상태</th>
        <td>${item.deliveryStatus}</td>
    </tr>
</table>
</body>
</html>