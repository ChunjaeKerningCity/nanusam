package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.CartVO;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.mapper.CartMapper;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;
    private final GoodsMapper goodsMapper;

    @Autowired
    public CartServiceImpl(GoodsMapper goodsMapper, CartMapper cartMapper, ModelMapper modelMapper) {
        this.goodsMapper = goodsMapper;
        this.cartMapper = cartMapper;
        this.modelMapper = modelMapper;
    }

    @Override
    public int totalCount(String memberId) {
//        log.info("===================================");
//        log.info("CartServiceImpl >> totalCount() START");
        int count = cartMapper.totalCount(memberId);
//        log.info("Total cart count for memberId = " + memberId + ": " + count);
//        log.info("CartServiceImpl >> totalCount() END");
//        log.info("===================================");
        return count;
    }

    @Override
    public List<CartDTO> list(){
        return List.of();
    }

    @Override
    public List<CartDTO> list(String memberId) {
//        log.info("===================================");
//        log.info("CartServiceImpl >> list() START");
        List<CartVO> voList = cartMapper.list(memberId);
        List<CartDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, CartDTO.class))
                .collect(Collectors.toList());
//        log.info("voList = " + voList);
//        log.info("dtoList = " + dtoList);
//        log.info("CartServiceImpl >> list() END");
//        log.info("===================================");
        return dtoList;
    }



    @Override
    public PageResponseDTO<CartDTO> listByPage(PageRequestDTO pageRequestDTO) {
//        log.info("===================================");
//        log.info("CartServiceImpl >> listByPage() START");
//        log.info("page_no = " + pageRequestDTO.getPage_no());
//        log.info("page_size = " + pageRequestDTO.getPage_size());
//        log.info("page_skip = " + pageRequestDTO.getPage_skip_count());
//        log.info("page_block = " + pageRequestDTO.getPage_block_size());

//        pageRequestDTO.setMemberId(memberId);

        List<CartVO> voList = cartMapper.listByPage(pageRequestDTO);
//        log.info("voList = " + voList);

        List<CartDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, CartDTO.class))
                .collect(Collectors.toList());
        int total_count = cartMapper.totalCount(pageRequestDTO.getMemberId());

        PageResponseDTO<CartDTO> pageResponseDTO = PageResponseDTO.<CartDTO>withAll()
                .reqDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

//        log.info("dtoList = " + dtoList);
//        log.info("CartServiceImpl >> listByPage() END");
//        log.info("===================================");
        return pageResponseDTO;
    }


    @Override
    public String add(CartDTO dto) {
        GoodsVO goods =goodsMapper.view(dto.getGoodsIdx());

        if (goods.getMemberId().equals(dto.getMemberId())) {
//            log.info("직접 등록한 상품은 장바구니에 추가할 수 없습니다.");
            return "직접 등록한 상품은 장바구니에 추가할 수 없습니다.";
        }

        CartVO vo = modelMapper.map(dto, CartVO.class);
        cartMapper.add(vo);
        int count = cartMapper.exist(vo);
        if(count>0){
//            log.info("이미 장바구니에 해당 상품 존재");
            return "이미 장바구니에 해당 상품 존재";
        }

        cartMapper.add(vo);
//        log.info("===================================");
//        log.info("CartServiceImpl >> regist() START");
//        log.info("vo = " + vo);
//        log.info("CartServiceImpl >> regist() END");
//        log.info("===================================");
        dto.setIdx(vo.getIdx());
        return "장바구니에 담았습니다.";
    }


    @Override
    public boolean existCart(CartDTO dto){
        CartVO vo = modelMapper.map(dto, CartVO.class);
        int count = cartMapper.exist(vo);
        return count>0;
    }


    @Override
    public void delete(int idx) {
        cartMapper.delete(idx);

//        log.info("===================================");
//        log.info("CartServiceImpl >> delete() START");
//        log.info("vo = " + idx);
//        log.info("CartServiceImpl >> delete() END");
//        log.info("===================================");
    }

}
