package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {
    public List<GoodsVO> listByPage(PageRequestDTO requestDTO, String searchKeyword, String searchCategory);
}
