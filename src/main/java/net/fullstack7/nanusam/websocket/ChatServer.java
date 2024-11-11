package net.fullstack7.nanusam.websocket;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;
import java.io.IOException;

@Component
@ServerEndpoint(value = "/chat", configurator = ChatServer.EndpointConfigurator.class)
@Log4j2
public class ChatServer {
    private static ChatService chatService; // 정적 필드로 ChatService를 선언

    @Autowired
    public void setChatService(ChatService chatService) {
        ChatServer.chatService = chatService; // ChatService를 정적 필드에 주입
    }

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        if(httpSession != null) {
            String loginId = (String) httpSession.getAttribute("memberId");
            if(loginId != null) {
                session.getUserProperties().put("memberId", loginId);
            }
            log.info("접속아이디 : " + loginId);
        }else{
            log.info("세션이 없습니다.");
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get(HttpSession.class.getName());
        if(httpSession != null) {
            String sender = (String) httpSession.getAttribute("memberId");
            //메시지 형식 receiver||message
            String[] messageArray = message.split("\\|\\|",2);
            String receiver = messageArray[0];
            String content = messageArray[1];
            
        }

    }

    @OnClose
    public void onClose(Session session) {

        log.info("웹소켓 종료 : " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.info("웹소켓 에러발생");
        log.info(error.getMessage());
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
