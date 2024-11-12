package net.fullstack7.nanusam.mapper.mapper;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.mapper.BbsMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/config/root-context.xml")
public class BbsMapperTests {
    @Autowired(required = false)
    private BbsMapper bbsMapper;

    @Test
    public void testGetTime() {
        log.info(bbsMapper.getTime());
    }

    @Test
    public void testRegist(){
        BbsVO bbsVO = BbsVO.builder()
                .memberId("테스트유저1")
                .title("테스트제목")
                .content("테스트내용")
                .category("1")
                .displayDate("2024-11-11")
                .build();

        bbsMapper.regist(bbsVO);
    }

    @Test
    public void testView(){
        BbsVO bbsVO = bbsMapper.view(1);
        log.info(bbsVO);
    }

    @Test
    public void testListByPage(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page_no(1)
                .page_size(10)
                .build();

        List<BbsVO> voList = bbsMapper.listByPage(pageRequestDTO);

        voList.forEach(bbsVO -> log.info(bbsVO));
    }
}
