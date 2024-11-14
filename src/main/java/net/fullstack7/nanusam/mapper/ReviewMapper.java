package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.ReviewVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {
    public int regist(ReviewVO vo);
    public ReviewVO view(int idx);
    public List<ReviewVO> listWithPage(PageRequestDTO dto);
    public int totalCount(PageRequestDTO dto);
    public int modify(ReviewVO vo);
    public int delete(int idx);
}
