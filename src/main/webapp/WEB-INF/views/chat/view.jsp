<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>chat view</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
      /* General styles */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7f9;
      color: #333;
    }
    div {
      margin-bottom: 10px;
    }

    /* Title styling */
    #chat_title {
      margin: 20px auto;
      width : 500px;
      text-align: center;
      padding: 5px;
      background-color: #ffffff;
      position : relative;

    }

    /* Chat container */
    #chatWindow {
      width : 500px;
      height: 350px;
      margin: 20px auto;
      padding: 10px;
      background-color: #ffffff;
      border-radius: 8px;
      border: 1px solid #ccc;
      overflow-y: scroll;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Message styling */
    #chatWindow div {
      margin-bottom: 10px;
    }

    /* Received message */
    div.otherMsg {
      text-align: left;
      color: #34495e;
    }

    div.systemMsg{
      text-align : center;
      font-weight : bold;
      color : #34495e;
    }

    /* Sent message */
    .myMsg {
      text-align: right;
      color: #2980b9;
      font-weight: bold;
    }

    /* Button styles */
    button {
      padding: 8px 12px;
      margin-right: 5px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 14px;
    }
    .dropdown_btn {
      background-color: #3498db;
      color: white;
    }
    #sendBtn {
      background-color: #3498db;
      margin-right : 0;
      color: white;
    }

    /* Input fields */
    #chatMessage {
      width: 430px;
      height: 35px;
      padding: 5px;
      font-size: 14px;
      margin-right : 13px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
    #chatMessageCont{
      width : 500px;

      margin: 20px auto;
    }
    #chatId {
      width: 160px;
      height: 30px;
      padding: 5px;
      font-size: 14px;
      border: 1px solid #aaa;
      background-color: #eeeeee;
      color: #555;
      border-radius: 5px;
      text-align: center;
    }

    /* Date/time styling */
    .timestamp {
      font-size: 12px;
      color: #888;
      display: block;
      text-align: right;
      margin-top: -8px;
      margin-bottom: 8px;
    }
  </style>
  </style>
</head>
<body>
<c:set var="loginId" value="${sessionScope.memberId}"/>
<input type="hidden" id="chatId" value="${other}"/>
<div id="chat_title" class="container text-center">
  <div class="row">
    <div class="col">
      <button type="button" class="btn btn-secondary" onclick="location.href='/chat/list.do'">◀</button>
    </div>
    <div class="col">
      채팅 상대 : ${other eq chatGroupDTO.seller ? chatGroupDTO.sellerName : chatGroupDTO.customerName}
      <br>
      상품 : ${chatGroupDTO.goodsName}
    </div>
    <div class="col">
      <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        ⋮
      </a>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" onclick="disconnect()">채팅방나가기</a></li>
        <c:if test="${loginId eq seller}">
          <li><a class="dropdown-item" onclick="reserve()">예약확정</a></li>
        </c:if>
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/goods/view.do?idx=${goodsIdx}">상품상세</a></li>
      </ul>
    </div>
  </div>
</div>
<%--<button id="closeBtn" class="dropdown_btn" onclick="disconnect();">채팅방나가기</button>--%>

<%--  <button id="btnReservation" class="dropdown_btn" onclick="disconnect();">결제링크보내기</button>--%>

<%--<button id="btnViewGoods" class="dropdown_btn" onclick="disconnect();">상품상세</button>--%>
<div id="chatWindow">
  <c:forEach items="${chatMessageList}" var="chat">
    <c:choose>
      <c:when test="${chat.senderId eq loginId}">
        <div class="myMsg">${chat.content}</div>
        <div class="myMsg timestamp">${chat.regDateStr} ${chat.regTimeStr}</div>
      </c:when>
      <c:when test="${chat.senderId eq 'system'}">
        <div class="systemMsg">
          system : ${chat.content}
        </div>
        <div class="systemMsg timestamp">
          ${chat.regDateStr} ${chat.regTimeStr}
        </div>
      </c:when>
      <c:otherwise>
        <div class="otherMsg">${chat.senderId} : ${chat.content}</div>
        <div class="otherMsg timestamp">${chat.regDateStr} ${chat.regTimeStr}</div>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>
<div id="chatMessageCont">
  <input type="text" id="chatMessage" onkeyup="enterInput();">
  <button id="sendBtn" onclick="sendMessage();">전송</button>
</div>
<script>
  let webSocket = new WebSocket("/chat/${groupIdx}");
  let chatWindow, chatMessage, chatId;

  window.onload = function(){
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById("chatId").value;
  }

  function sendMessage(){
    //chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
    webSocket.send(chatId + "||" + chatMessage.value);
    chatMessage.value="";
    chatWindow.scrollTop = chatWindow.scrollHeight;
  }

  function disconnect(){
    webSocket.send("system||disconnect||상대가 채팅방에서 나갔습니다.<br> 현재 페이지에서 이탈하면 다시 채팅방을 이용할 수 없습니다.||${other}" );
    location.href="/chat/deleteGroup.do?groupIdx=${groupIdx}";
  }

  function reserve(){
    webSocket.send("system||reservation||상품이 예약되었습니다.<br> 지금부터 예약자만 상품을 구매할 수 있습니다.||${other}" );
  }

  function enterInput(){
    if(window["event"].keyCode==13){
      sendMessage();
    }
  }

  webSocket.onopen = function(event){
    // 웹소켓 초기화
    chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.</br>";
  };

  webSocket.onclose = function(event){
    chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다</br>"
  };

  webSocket.onerror = function(event){
    chatWindow.innerHTML += "에러발생 </br>";
  }

  webSocket.onmessage = function(event){
    let message = event.data.split("\\|\\|");
    let sender = message[0];
    let content = message[1];
    let regDate = message[2];
    let readChk = message[3];
    console.log("sender : content : regDate : readChk >>" + sender +" : "+ content +" : "+regDate+" : "+readChk );
    if(sender === 'system'){
      chatWindow.innerHTML += "<div class='systemMsg'>"+content+"</div><div class='systemMsg timestamp'>" + regDate + "</div>";
    }else if(sender !== "${sessionScope.memberId}") {
      if (content !== "") {
        chatWindow.innerHTML += "<div class='otherMsg'>" + sender + " : " + content + "</div><div class='otherMsg timestamp'>" + regDate + "</div>";
      }
      chatWindow.scrollTop = chatWindow.scrollHeight;
    }else{
      if (content !== "") {
        chatWindow.innerHTML += "<div class='myMsg'>" + sender + " : " + content + "</div>"
                +"<div class='myMsg timestamp'>"+regDate+"</div>";
      }
    }
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
