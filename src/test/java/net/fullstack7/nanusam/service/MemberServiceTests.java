package net.fullstack7.nanusam.service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.*;


@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/config/root-context.xml")
public class MemberServiceTests {

    @Autowired
    private MemberService memberService;

    @Test
    public void testLoginSuccess() {
        String memberId = "user1";
        String pwd = "1234";

        boolean result = memberService.login(memberId, pwd);

        assertTrue(result);
    }
}
