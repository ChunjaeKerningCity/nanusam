package net.fullstack7.nanusam.websocket;

import lombok.extern.log4j.Log4j2;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/ChatingServer")
@Log4j2
public class ChatingServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        log.info("웹소켓 연결 : " + session.getId());
    }
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        log.info("메시지 전송 : " + session.getId() + message);
        synchronized (clients) {
            for(Session client : clients) {
                if(!client.equals(session)){
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        log.info("웹소켓 종료 : " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.info("웹소켓 에러발생");
        log.info(error.getMessage());
    }
}
