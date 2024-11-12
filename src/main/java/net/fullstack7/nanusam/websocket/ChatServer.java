package net.fullstack7.nanusam.websocket;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;
import java.io.IOException;

@Component
@ServerEndpoint(value = "/chat/{goodsIdx}", configurator = ChatServer.EndpointConfigurator.class)
@Log4j2
public class ChatServer {
    private static ChatService chatService; // 정적 필드로 ChatService를 선언

    @Autowired
    public void setChatService(ChatService chatService) {
        ChatServer.chatService = chatService; // ChatService를 정적 필드에 주입
    }

    @OnOpen
    public void onOpen(Session session, EndpointConfig config, @PathParam("goodsIdx") int goodsIdx) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        if(httpSession != null) {
            String loginId = (String) httpSession.getAttribute("memberId");
            if(loginId != null) {
                session.getUserProperties().put("memberId", loginId);
                session.getUserProperties().put("goodsIdx", goodsIdx);
                log.info("접속아이디 : " + loginId);
            }
        }else{
            log.info("세션이 없습니다.");
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
       log.info("onMessage: " + message);
       String sender = (String)session.getUserProperties().get("memberId");
       log.info("sender : " + sender);
       Integer goodsIdx = (Integer)session.getUserProperties().get("goodsIdx");
       log.info("goodsIdx : " + goodsIdx);
        //메시지 형식 receiver||message
        if (message == null || !message.contains("||")) {
            log.info("잘못된 메시지 형식: " + message);
            return;
        }
        String[] messageArr = message.split("\\|\\|");
        if (messageArr.length < 2) {
            log.info("메시지 형식 오류: " + message);
            return;
        }
       String receiver = messageArr[0];
       log.info("receiver : " + receiver);
       String content = messageArr[1];
       log.info("content : " + content);

       int result = chatService.regist(ChatDTO.builder().goodsIdx(goodsIdx).sender(sender).receiver(receiver).content(content).build());
       log.info("result : " + result);
       if(result>=0){
           // 수신자에게 메시지를 전송
           log.info("db등록성공");
           session.getOpenSessions().forEach(s -> {
               if (receiver.equals(s.getUserProperties().get("memberId"))) {
                   try {
                       s.getBasicRemote().sendText(sender + "\\|\\|" + content);
                   } catch (Exception e) {
                       log.info(e.getMessage());
                   }
               }
           });
       }


    }

    @OnClose
    public void onClose(Session session) {

        log.info("웹소켓 종료 : " + (String)session.getUserProperties().get("memberId"));
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.info("웹소켓 에러발생");
        log.info("에러메세지 :" + error.getMessage());
    }

    public static class EndpointConfigurator extends ServerEndpointConfig.Configurator{
        @Override
        public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
            HttpSession httpSession = (HttpSession) request.getHttpSession();
            if(httpSession != null) {
                config.getUserProperties().put(HttpSession.class.getName(), httpSession);
            }
        }
    }
}
