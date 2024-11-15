package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.*;

import java.util.List;

public interface GoodsService {
    PageResponseDTO<GoodsDTO> listByPage(PageRequestDTO requestDTO);
    PageResponseDTO<GoodsDTO> listWithPayInfo(PageRequestDTO requestDTO);
    int totalCount();
    String regist(GoodsDTO goodsDTO);
    String fileupload(FileDTO file);
    GoodsDTO view(int idx);
    List<CodeDTO> codeList(String type);
    List<FileDTO> fileListByBbsCodeAndRefIdx(String bbsCode, int refIdx);
    String deleteFileByName(String name);
    String modifyGoodsInfo(GoodsDTO goodsDTO);
}
