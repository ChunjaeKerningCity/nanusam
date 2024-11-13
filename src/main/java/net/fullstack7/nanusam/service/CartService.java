package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;

import java.util.List;

public interface CartService {
    int totalCount();
    List<CartDTO> list();
    PageResponseDTO<CartDTO> listByPage(PageRequestDTO requestDTO);

    void regist(CartDTO dto);
    void delete(int idx);
}
