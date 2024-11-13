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
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f9;
            color: #333;
        }
        h1 {
            text-align: center;
            padding: 20px 0;
            color: #555;
        }

        /* Table styles */
        table {
            width: 500px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        table td, table th {
            padding: 15px;
            text-align: left;
            border-right : 1px solid #e0e0e0;
            border-bottom: 1px solid #e0e0e0;
        }

        table tr.groupContainer:hover {
            background-color: #f1f8ff;
        }

        /* Header row */
        table th {
            font-weight: bold;
        }

        /* Chat message cell */
        td div {
            font-weight: bold;
            color: #aaa;
        }

        /* Unread message styling */
        .receiveNewMessage {
            color: #34495e;
            font-weight: bold;
        }
        .unreadCount {
            font-size: 12px;
            color: white;
            background-color: #e74c3c;
            padding: 2px 8px;
            border-radius: 12px;
            margin-left: 8px;
        }

        /* Timestamp styling */
        td:last-child {
            text-align: right;
            font-size: 12px;
            color: #888;
        }
        .messageCont{
            width : 75%;
        }
    </style>
</head>
<body>
    <h1>채팅 리스트</h1>
    <table>
        <tr>
            <th class="messageCont">메시지</th>
            <th class="timeCont">보낸시간</th>
        </tr>
        <c:forEach items="${chatList}" var="chat">
            <c:set var="sender" value="${sessionScope.memberId ne chat.seller ? chat.seller : chat.customer}"/>
            <tr class="groupContainer">
                <c:if test="${not empty chat.lastMessage.content}" var="lastMessage">
                </c:if>

                <td class="${(sender eq chat.lastMessage.senderId) and lastMessage ? 'receiveNewMessage' : ''}" onclick="chatViewOpen('groupIdx=${chat.idx}')">
                    <div>${sender}</div>
                    <c:if test="${lastMessage}">
                        ${chat.lastMessage.content} <span class="unreadCount">${chat.unreadCount}</span>
                    </c:if>
                    <c:if test="${not lastMessage}">
                        새로운 채팅방
                    </c:if>
                </td>
                <td>${chat.lastMessage.regDate}</td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function chatViewOpen (queryString){
            location.href="/chat/view.do?"+queryString;
        }
    </script>
</body>
</html>
