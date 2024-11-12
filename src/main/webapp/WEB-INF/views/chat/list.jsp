<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>chat list</title>
</head>
<body>
    <h1>채팅 리스트</h1>
    <table>
        <tr>
            <td>보낸사람</td>
            <td>메시지</td>
            <td>보낸시간</td>
        </tr>
        <c:forEach items="${chatList}" var="chat">
            <tr>
                <td>${chat.sender}</td>
                <td onclick="chatViewOpen('sender=${chat.sender}&receiver=${chat.receiver}&goodsIdx=${chat.goodsIdx}')">${chat.content}</td>
                <td>${chat.regDate}</td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function chatViewOpen (queryString){
            window.open("/chat/view.do?"+queryString, "", "width=320,height=400");
        }
    </script>
</body>
</html>
