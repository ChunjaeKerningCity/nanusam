<%--
  Created by IntelliJ IDEA.
  User: full5-2
  Date: 2024-11-13
  Time: 오후 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>

<table>
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">First</th>
        <th scope="col">Last</th>
        <th scope="col">Handle</th>
        <th scope="col">Handle</th>
        <th scope="col">Handle</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${pageinfo.dtoList}" var="item">
        <tr>
            <td><a href="/payment/view.do?idx=${item.idx}">${item.payDateStr}</a></td>
            <td><img src="/resources/image/goods_${item.goodsInfo.idx}_0.png" alt="/resources/image/goods_${item.goodsInfo.name}_0.jpg"></td>
            <td>${item.seller}</td>
            <td>${item.buyer}</td>
            <td>${item.goodsInfo.name}</td>
            <td>${item.deliveryStatus}</td>
        </tr>
    </c:forEach>


    </tbody>
</table>



<%--    페이징--%>
<div class="row" style="margin-top: 1rem;">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${pageinfo.prev_page_flag}">
                <li class="page-item">
                    <a class="page-link" href="/payment/list.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}&searchCategory=${pageinfo.searchCategory}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}" step="1">
                <li class="page-item"><a class="page-link" href="/payment/list.do?page_no=${no}&searchCategory=${pageinfo.searchCategory}">${no}</a></li>
            </c:forEach>
            <c:if test="${pageinfo.next_page_flag}">
                <li class="page-item">
                    <a class="page-link" href="/payment/list.do?page_no=${pageinfo.page_block_end + 1}&searchCategory=${pageinfo.searchCategory}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

</body>
</html>
