package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;

public interface GoodsService {
    public PageResponseDTO<GoodsDTO> listByPage(PageRequestDTO requestDTO);
    public int totalCount();
}
