package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.CartVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;

import java.util.List;

public interface CartMapper {
    List<CartVO> list();
    List<CartVO> listByPage(PageRequestDTO requestDTO);
    int totalCount();
    void add(CartVO vo);
    void delete(int idx);
}
