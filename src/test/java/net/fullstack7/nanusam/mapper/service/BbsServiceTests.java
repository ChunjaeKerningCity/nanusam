package net.fullstack7.nanusam.mapper.service;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.service.BbsService;
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
public class BbsServiceTests {
    @Autowired(required = false)
    private BbsService bbsService;

    @Test
    public void testList(){
        List<BbsDTO> dto = bbsService.list();
        Assertions.assertNotNull(dto);
        log.info("dto : "+dto);
    }

    @Test
    public void testView(){
        int idx = 1;
        BbsDTO dto = bbsService.view(idx);
        Assertions.assertNotNull(dto);
        log.info("dto : "+dto);
        log.info("idx : "+idx);
    }

    @Test
    public void testRegist(){

    }

    @Test
    public void testModify(){

    }

    @Test
    public void testDelete(){

    }



}
