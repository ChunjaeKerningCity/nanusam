package net.fullstack7.nanusam.service;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.MemberDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/config/root-context.xml")
public class MemberServiceTests {

    @Autowired(required = false)
    private MemberService service;

    @Test
    public void testLoginSuccess() {
        String memberId = "user1";
        String pwd = "1234";

        MemberDTO memberDTO = service.login(memberId, pwd);

        Assertions.assertEquals("t", memberDTO.getMemType());
        Assertions.assertEquals("Y", memberDTO.getStatus());
        Assertions.assertNotNull(memberDTO);

        log.info("Login success: " + memberDTO);
    }


//    @Test
//    public void testPwdCheck() {
//        String memberId = "user1";
//        String pwd = "1234";
//        boolean memberDTO = service.pwdCheck(memberId,pwd);
//
//        Assertions.assertTrue(memberDTO);
//    }


    @Test
    public void testMemberModify(){

    }



}