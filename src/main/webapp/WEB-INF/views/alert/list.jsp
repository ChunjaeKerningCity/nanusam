<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-15
  Time: 오후 6:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>알람 리스트</title>
</head>
<body>
    <table>
        <tr>
            <th>알람 내용</th>
            <th>날짜</th>
        </tr>
        <c:forEach items="${pageDTO.dtoList}" var="alert" varStatus="loop">
            <tr class="${alert.readChk lt 2 ? 'newAlert' : ''}">
                <td>${alert.content}</td>
                <td>${alert.regDateStr}</td>
                    ${alert.readChk lt 2 ? 'newAlert' : ''}
            </tr>
        </c:forEach>
    </table>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                                <c:when test="${pageDTO.prev_page_flag}">?page_no=${pageDTO.page_block_start-1}</c:when>
                                                <c:otherwise>#</c:otherwise>
                                                </c:choose>" aria-label="이전">
                    <span aria-hidden="true">&langle;</span>
                </a>
            </li>
            <c:forEach begin="${pageDTO.page_block_start}" end="${pageDTO.page_block_end}" var="page_num">
                <li class="page-item ${pageDTO.page_no == page_num? "active":""}"><a class="page-link" href="?page_no=${page_num}">${page_num}</a></li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                               <c:when test="${pageDTO.next_page_flag}">?page_no=${pageDTO.page_block_end+1}</c:when>
                                               <c:otherwise>#</c:otherwise>
                                                </c:choose>" aria-label="다음">
                    <span aria-hidden="true">&rangle;</span>
                </a>
            </li>
        </ul>
    </nav>

</body>
</html>
