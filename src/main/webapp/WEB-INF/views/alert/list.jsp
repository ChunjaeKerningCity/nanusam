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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>알람 리스트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
            color: #333;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .newAlert {
            font-weight: bold;
            background-color: #fff4e5;
        }

        nav {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .pagination {
            display: flex;
            list-style-type: none;
            padding: 0;
        }

        .pagination li {
            margin: 0 5px;
        }

        .pagination .page-link {
            text-decoration: none;
            color: #007bff;
            padding: 10px 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination .page-link:hover {
            background-color: #e9ecef;
        }

        .leftTd {
            -moz-border-radius-topleft : 30px;
            -moz-border-radius-bottomleft : 30px;
            margin-top : 10px;
        }

        .rightTd {
            -moz-border-radius-bottomright : 30px;
            -moz-border-radius-topright : 30px;
            margin-top : 10px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <table>
        <tr>
            <th>알람 내용</th>
            <th>날짜</th>
        </tr>
        <c:forEach items="${pageDTO.dtoList}" var="alert" varStatus="loop">
            <tr class="${alert.readChk lt 2 ? 'newAlert' : ''}">
                <td class="leftTd">${alert.content}</td>
                <td class="rightTd">${alert.regDateStr}</td>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous">
    </script>
    <script>
        window.onbeforeunload = function(){
            if(window.opener  && !window.opener.closed){
                window.opener.postMessage("childClosed", "*");
            }
        }
    </script>

</body>
</html>
