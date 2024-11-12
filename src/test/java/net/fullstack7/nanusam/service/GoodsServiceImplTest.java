package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.PageRequestDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/config/root-context.xml")
public class GoodsServiceImplTest {
    @Autowired(required=false)
    private GoodsServiceImpl goodsService;

    @Test
    public void testlist() {
        Assertions.assertNotNull(goodsService.listByPage(new PageRequestDTO()));
    }
}
