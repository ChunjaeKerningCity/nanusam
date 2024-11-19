package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.ReviewVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.ReviewDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReviewService {
    public int regist(ReviewDTO dto);
    public ReviewDTO view(int idx);
    public PageResponseDTO<ReviewDTO> listWithPage(PageRequestDTO dto);
    public PageResponseDTO<ReviewDTO> listWithPageAndMember(PageRequestDTO dto, String memberType, String memberId);
    public int totalCountWithMember(PageRequestDTO dto, String memberType, String memberId);
    public int totalCount(PageRequestDTO dto);
    public int modify(ReviewDTO dto);
    public int delete(int idx);
}
