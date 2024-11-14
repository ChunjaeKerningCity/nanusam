package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.domain.CartVO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.mapper.CartMapper;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import org.apache.ibatis.annotations.Param;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;

    @Override
    public int totalCount(String memberId) {
        log.info("===================================");
        log.info("CartServiceImpl >> totalCount() START");

        int count = cartMapper.totalCount(memberId);

        log.info("Total cart count for memberId = " + memberId + ": " + count);
        log.info("CartServiceImpl >> totalCount() END");
        log.info("===================================");
        return count;
    }

    @Override
    public List<CartDTO> list(){
        return List.of();
    }

    @Override
    public List<CartDTO> list(String memberId) {
        log.info("===================================");
        log.info("CartServiceImpl >> list() START");

        List<CartVO> voList = cartMapper.list(memberId);
        List<CartDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, CartDTO.class))
                .collect(Collectors.toList());

        log.info("voList = " + voList);
        log.info("dtoList = " + dtoList);
        log.info("CartServiceImpl >> list() END");
        log.info("===================================");
        return dtoList;
    }



    @Override
    public PageResponseDTO<CartDTO> listByPage(PageRequestDTO pageRequestDTO) {
        log.info("===================================");
        log.info("CartServiceImpl >> listByPage() START");
        log.info("page_no = " + pageRequestDTO.getPage_no());
        log.info("page_size = " + pageRequestDTO.getPage_size());
        log.info("page_skip = " + pageRequestDTO.getPage_skip_count());
        log.info("page_block = " + pageRequestDTO.getPage_block_size());

//        pageRequestDTO.setMemberId(memberId);

        List<CartVO> voList = cartMapper.listByPage(pageRequestDTO);
        log.info("voList = " + voList);

        List<CartDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, CartDTO.class))
                .collect(Collectors.toList());
        int total_count = cartMapper.totalCount(pageRequestDTO.getMemberId());

        PageResponseDTO<CartDTO> pageResponseDTO = PageResponseDTO.<CartDTO>withAll()
                .reqDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        log.info("dtoList = " + dtoList);
        log.info("CartServiceImpl >> listByPage() END");
        log.info("===================================");
        return pageResponseDTO;
    }


    @Override
    public void add(CartDTO dto) {
        CartVO vo = modelMapper.map(dto, CartVO.class);
        cartMapper.add(vo);

        log.info("===================================");
        log.info("CartServiceImpl >> regist() START");
        log.info("vo = " + vo);
        log.info("CartServiceImpl >> regist() END");
        log.info("===================================");
    }

    @Override
    public void delete(int idx) {
        cartMapper.delete(idx);
    }

}
