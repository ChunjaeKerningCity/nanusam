<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <%@include file="paymentviewcss.jsp"%>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        th {
            text-align: center;
            width: 200px;
        }
        td {
            text-align: left;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<main class="marginTop">
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
<h3>상품정보</h3>
<table>
    <tr>
        <td rowspan="4" style="width: 200px"><img height="200px" src="/resources/image/${item.goodsInfo.mainImageName}"></td>
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
        <td>
            <c:choose>
                <c:when test="${item.deliveryStatus == '0'}">
                    배송 전
                </c:when>
                <c:when test="${item.deliveryStatus == '1'}">
                    배송 중
                </c:when>
                <c:otherwise>
                    배송 완료
                </c:otherwise>
            </c:choose>


        </td>
    </tr>
    <c:if test="${item.deliveryStatus == '1'}">
    <tr>
        <th>

        </th>
        <td>

                <button onclick="location.href='/payment/deliveryEnd.do?idx=${item.idx}'">배송확인</button>
        </td>
    </tr>
    </c:if>

</table>
        </div>
        <div class="commonRight"></div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>