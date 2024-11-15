package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapper {
    List<GoodsVO> listByPage(PageRequestDTO requestDTO);
    int totalCount(PageRequestDTO requestDTO);
    void regist(GoodsVO goodsVO);
    void deleteByIdx(int idx);
    GoodsVO view(int idx);
    void modifyGoodsInfo(GoodsVO goodsVO);
    String getSellerId(int idx);
}
