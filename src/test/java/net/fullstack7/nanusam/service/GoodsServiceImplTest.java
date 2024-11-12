package net.fullstack7.nanusam.service;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/config/root-context.xml")
public class GoodsServiceImplTest {
    @Autowired(required=false)
    private GoodsServiceImpl goodsService;

    @Test
    public void testlist() {
        Assertions.assertNotNull(goodsService.listByPage(new PageRequestDTO()));
    }

    @Test
    public void testRegist() {
        GoodsDTO goodsDTO = GoodsDTO.builder().name("asd;lfkj").price(3000).category("00").memberId("user1").quality("중").status("1").build();
        goodsService.regist(goodsDTO);
        log.info(goodsDTO.getIdx());
    }
}
