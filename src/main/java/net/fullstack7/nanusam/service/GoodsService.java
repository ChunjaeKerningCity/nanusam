package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.CodeVO;
import net.fullstack7.nanusam.dto.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface GoodsService {
    PageResponseDTO<GoodsDTO> listByPage(PageRequestDTO requestDTO);
    int totalCount();
    void regist(GoodsDTO goodsDTO);
    void fileupload(FileDTO file);
    GoodsDTO view(int idx);
    List<CodeDTO> codeList(String type);
    List<FileDTO> fileListByBbsCodeAndRefIdx(String bbsCode, int refIdx);
    void deleteFileByName(String name);
    String modifyGoodsInfo(GoodsDTO goodsDTO);
}
