package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.ReviewVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {
    public int regist(ReviewDTO dto);
    public ReviewDTO view(int idx);
    public PageResponseDTO<ReviewDTO> listWithPage(PageRequestDTO dto);
    public int totalCount(PageRequestDTO dto);
    public int modify(ReviewDTO dto);
    public int delete(int idx);
}
