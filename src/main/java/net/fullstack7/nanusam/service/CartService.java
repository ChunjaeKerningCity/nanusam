package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;

import java.util.List;

public interface CartService {
    public int totalCount(String memberId);
    public List<CartDTO> list();
    public List<CartDTO> list(String memberId);
    public PageResponseDTO<CartDTO> listByPage(PageRequestDTO requestDTO);
    void add(CartDTO dto);
    void delete(int idx);
}
