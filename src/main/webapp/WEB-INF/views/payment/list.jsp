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
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>

<c:forEach items="${pageinfo.dtoList}" var="item">
    <ul>
        <li>${item.seller}</li>
        <li>${item.buyer}</li>
        <li>${item.goodsInfo.name}</li>
    </ul>
</c:forEach>


<%--    페이징--%>
<div class="row" style="margin-top: 1rem;">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${pageinfo.prev_page_flag}">
                <li class="page-item">
                    <a class="page-link" href="/goods/list.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}" step="1">
                <li class="page-item"><a class="page-link" href="/goods/list.do?page_no=${no}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}">${no}</a></li>
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
