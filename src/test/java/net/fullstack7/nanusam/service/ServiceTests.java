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
}
