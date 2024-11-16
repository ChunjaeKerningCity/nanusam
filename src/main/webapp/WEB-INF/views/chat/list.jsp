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
            width: 700px;
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
            background-color: #34495e;
            padding: 2px 8px;
            border-radius: 12px;
            margin-left: 8px;
        }
        td{
            font-size : 18px;
        }
        /* Timestamp styling */
        td:last-child {
            text-align: right;
            font-size: 16px;
            color: #888;
        }
        .messageCont{
            width : 60%;
        }
        .goods_img img {
            width: 80px; /* 이미지 너비 조정 */
            height: auto; /* 비율에 맞게 높이 자동 조정 */
            border-radius: 5px; /* 이미지를 둥글게 처리 (선택사항) */
        }

        .chat_goods {
            font-weight: bold;
            color: #333;
            margin-bottom: 10px; /* 상품명 아래 여백 추가 */
        }
    </style>
</head>
<body>
    <h1>채팅 리스트</h1>
    <table>
        <tr>
            <th class="goodsInfo">상품정보</th>
            <th class="messageCont">메시지</th>
            <th class="timeCont">보낸시간</th>
        </tr>
        <c:forEach items="${chatList}" var="chat">
            <c:set var="sender" value="${sessionScope.memberId ne chat.seller ? chat.seller : chat.customer}"/>
            <tr class="groupContainer">
                <c:if test="${not empty chat.lastMessage.content}" var="lastMessage"/>

                <td>
                    <div class="chat_goods">${chat.goodsName}</div>
                    <div class="goods_img"><img src="/resources/image/goods_${chat.goodsIdx}_0.png" alt=""></div>
                </td>
                <td class="${(sender eq chat.lastMessage.senderId) and (chat.unreadCount gt 0) and lastMessage ? 'receiveNewMessage' : ''}" onclick="chatViewOpen('groupIdx=${chat.idx}')">
                    <div>${sender eq chat.seller ? chat.sellerName : chat.customerName}</div>
                    <c:if test="${lastMessage}">
                        ${chat.lastMessage.content}
                        <c:if test="${chat.unreadCount gt 0}">
                            <span class="unreadCount">${chat.unreadCount}</span>
                        </c:if>
                    </c:if>
                    <c:if test="${not lastMessage}">
                        새로운 채팅방
                    </c:if>
                </td>
                <td>${chat.lastMessage.regDateStr}<br>${chat.lastMessage.regTimeStr}</td>
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
