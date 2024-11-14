package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.ReviewVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.ReviewDTO;
import net.fullstack7.nanusam.mapper.ReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(ReviewDTO dto) {
        return reviewMapper.regist(modelMapper.map(dto, ReviewVO.class));
    }

    @Override
    public ReviewDTO getReview(int idx) {
        return modelMapper.map(reviewMapper.getReview(idx), ReviewDTO.class);
    }

    @Override
    public PageResponseDTO<ReviewDTO> listWithPage(PageRequestDTO dto) {
        return null;
    }

    @Override
    public int totalCount(PageRequestDTO dto) {
        return 0;
    }

    @Override
    public int modify(ReviewVO vo) {
        return 0;
    }

    @Override
    public int delete(int idx) {
        return 0;
    }
}
