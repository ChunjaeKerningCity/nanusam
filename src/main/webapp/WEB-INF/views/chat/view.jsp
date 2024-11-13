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
  <style>
    #chatWindow{border:1px solid black; width:270px; height:310px; overflow:scroll; padding:5px;}
    #chatMessage{width:236px; height:30px;}
    #sendBtn{height:30px; position:relative; top:2px; left:-2px;}
    #closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
    #chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
    .myMsg{text-align:right;}
  </style>
</head>
<body>
<c:set var="loginId" value="${sessionScope.memberId}"/>
<input type="hidden" id="chatId" value="${other}"/>
<div>채팅 상대 : ${other}</div>
<button id="closeBtn" onclick="disconnect();">채팅방나가기</button>
<c:if test="${loginId eq seller}">
  <button id="closeBtn" onclick="disconnect();">결제링크보내기</button>
</c:if>
<button id="closeBtn" onclick="disconnect();">상품상세</button>
<div id="chatWindow">
  <c:forEach items="${chatMessageList}" var="chat">
    <c:choose>
      <c:when test="${chat.senderId ne loginId}">
        <div>${chat.senderId} : ${chat.content}</div>
        <div>${chat.regDateStr}${chat.regTimeStr}</div>
      </c:when>
      <c:otherwise>
        <div class="myMsg">${chat.content}</div>
        <div class="myMsg">${chat.regDate}${chat.regTimeStr}</div>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>
<div>
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
    webSocket.send(chatId + "||상대가 채팅방에서 나갔습니다. 현재 페이지에서 이탈하면 다시 채팅방을 이용할 수 없습니다." );
    location.href="/chat/deleteGroup.do?groupIdx=${groupIdx}";
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
    if(message[0]==='readStatus'){

      return;
    }
    let sender = message[0];
    let content = message[1];
    let regDate = message[2];
    let readChk = message[3];
    console.log("sender : content : regDate : readChk >>" + sender +" : "+ content +" : "+regDate+" : "+readChk );
    if(sender !== "${sessionScope.memberId}") {
      if (content !== "") {
        chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div><div>" + regDate + "</div>";
      }
      chatWindow.scrollTop = chatWindow.scrollHeight;
    }else{
      if (content !== "") {
        chatWindow.innerHTML += "<div class='myMsg'>" + sender + " : " + content + "</div>"
                +"<div class='myMsg'>"+regDate+"</div>";
      }
    }
  }
</script>
</body>
</html>
