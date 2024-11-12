package net.fullstack7.nanusam.service;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.ChatDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/config/root-context.xml")
public class ServiceTests {
    @Autowired(required=false)
    ChatService chatService;
    @Test
    public void chatRegistTest(){
        log.info("chatRegistTest");
        chatService.regist(
                ChatDTO.builder()
                        .sender("user1")
                        .receiver("user2")
                        .content("testContent")
                        .goodsIdx(2)
                        .build()
        );
    }
    @Test
    public void chatListTest(){
        log.info("chatListTest");
        log.info(chatService.getList("testSender1"));
    }

    @Test
    public void chatViewTest(){
        log.info("chatViewTest");
        log.info(chatService.view(1, "testSender1", "testReceiver1"));
    }
}