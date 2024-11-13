package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.domain.CartVO;
import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.mapper.CartMapper;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;

    @Override
    public int totalCount() {
        return 0;
    }

    @Override
    public List<CartDTO> list() {
        log.info("===================================");
        log.info("CartServiceImpl >> list() START");

        List<CartVO> voList = cartMapper.list();
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
    public PageResponseDTO<CartDTO> listByPage(PageRequestDTO requestDTO) {

        return null;
    }


    @Override
    public void regist(CartDTO dto) {

    }

    @Override
    public void delete(int idx) {

    }

}
