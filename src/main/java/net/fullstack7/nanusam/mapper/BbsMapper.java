package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BbsMapper {
    String getTime();

    int totalCount();
    List<BbsVO> list();
    List<BbsVO> listByPage(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);
    BbsVO view(int idx);
    void regist(BbsVO vo);
    void modify(BbsVO vo);
    void delete(int idx);
    int addReadCnt(int idx);
}
