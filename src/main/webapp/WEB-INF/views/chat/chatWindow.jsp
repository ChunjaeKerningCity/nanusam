<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>웹소켓 채팅</title>
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
    대화명 : <input type="text" id="chatId" value="${ chatId }" readonly />
    <button id="closeBtn" onclick="disconnect();">채팅 종료</button>
    <div id="chatWindow"></div>
    <div>
        <input type="text" id="chatMessage" onkeyup="enterInput();">
        <button id="sendBtn" onclick="sendMessage();">전송</button>
    </div>
    <script>
        let webSocket = new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
        let chatWindow, chatMessage, chatId;

        window.onload = function(){
            chatWindow = document.getElementById("chatWindow");
            chatMessage = document.getElementById("chatMessage");
            chatId = document.getElementById("chatId");
            chatId = chatId.value;
        }

        function sendMessage(){
            chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
            webSocket.send(chatId + "|" + chatMessage.value);
            chatMessage.value="";
            chatWindow.scrollTop = chatWindow.scrollHeight;
        }

        function disconnect(){
            webSocket.close();
        }

        function enterInput(){
            if(window["event"].keyCode==13){
                sendMessage();
            }
        }

        webSocket.onopen = function(event){
            chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.</br>";
        };

        webSocket.onclose = function(event){
            chatWindow.innerHTML += "웹소켄 서버가 종료되었습니다</br>"
        };

        webSocket.onerror = function(event){
            chatWindow.innerHTML += "에러발생 </br>";
        }

        webSocket.onmessage = function(event){
            let message = event.data.split("|");
            let sender = message[0];
            let content = message[1];
            if(content !== ""){
                if(content.match("/")) {
                    if (content.match("/" + chatId)) {
                        let temp = content.replace(("/"+chatId),"[귓속말] : ");
                        chatWindow.innerHTML += "<div>"+sender+""+temp+"</div>";
                    }
                }else{
                    chatWindow.innerHTML += "<div>"+sender+" : "+content+"</div>";
                }
            }
            chatWindow.scrollTop = chatWindow.scrollHeight;
        }
    </script>
</body>
</html>
