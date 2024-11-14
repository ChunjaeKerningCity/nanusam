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

import java.util.stream.Collectors;

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
    public ReviewDTO view(int idx) {
        return modelMapper.map(reviewMapper.view(idx), ReviewDTO.class);
    }

    @Override
    public PageResponseDTO<ReviewDTO> listWithPage(PageRequestDTO dto) {
        return PageResponseDTO
                .<ReviewDTO>withAll()
                .reqDTO(dto)
                .dtoList(reviewMapper.listWithPage(dto).stream().map(vo->modelMapper.map(vo,ReviewDTO.class)).collect(Collectors.toList()))
                .total_count(reviewMapper.totalCount(dto))
                .build();
    }

    @Override
    public PageResponseDTO<ReviewDTO> listWithPageAndMember(PageRequestDTO dto, String memberType, String memberId) {
        return PageResponseDTO
                .<ReviewDTO>withAll()
                .reqDTO(dto)
                .dtoList(reviewMapper.listWithPageAndMember(dto,memberType,memberId).stream().map(vo->modelMapper.map(vo,ReviewDTO.class)).collect(Collectors.toList()))
                .total_count(totalCountWithMember(dto,memberType,memberId))
                .build();
    }

    @Override
    public int totalCountWithMember(PageRequestDTO dto, String memberType, String memberId) {
        return reviewMapper.totalCountWithMember(dto,memberType,memberId);
    }

    @Override
    public int totalCount(PageRequestDTO dto) {
        return reviewMapper.totalCount(dto);
    }

    @Override
    public int modify(ReviewDTO dto) {
        return reviewMapper.modify(modelMapper.map(dto, ReviewVO.class));
    }

    @Override
    public int delete(int idx) {
        return reviewMapper.delete(idx);
    }
}
