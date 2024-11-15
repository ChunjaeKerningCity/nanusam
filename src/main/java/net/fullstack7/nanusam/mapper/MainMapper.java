package net.fullstack7.nanusam.mapper;

import java.util.List;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MainMapper {
  // main페이지 상품 출력
  List<GoodsVO> mainViewGoodsList(@Param("offset") int offset, @Param("limit") int limit);
}
