package net.fullstack7.nanusam.service;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.service.CartService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/config/root-context.xml")
public class CartServiceTests {
    @Autowired(required = false)
    private CartService cartService;

    @Test
    public void testList(){
        List<CartDTO> dto = cartService.list();
        Assertions.assertNotNull(dto);
        Assertions.assertTrue(dto.size() > 0);
        log.info("dto:"+dto);
        if(dto.isEmpty()){
            Assertions.assertNotNull(dto.get(0).getMemberId());
        }
    }

    @Test
    public void testAdd(){
        CartDTO dto = CartDTO.builder()
                .memberId("테스트유저2")
                .goodsIdx(2)
                .build();

        cartService.add(dto);
    }



}
