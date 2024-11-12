package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import org.springframework.web.multipart.MultipartFile;

public interface GoodsService {
    PageResponseDTO<GoodsDTO> listByPage(PageRequestDTO requestDTO);
    int totalCount();
    void regist(GoodsDTO goodsDTO);
    void fileupload(MultipartFile file);
}
