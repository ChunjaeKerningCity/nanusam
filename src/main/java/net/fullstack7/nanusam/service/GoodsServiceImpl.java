package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.CodeVO;
import net.fullstack7.nanusam.domain.FileVO;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.*;
import net.fullstack7.nanusam.mapper.CodeMapper;
import net.fullstack7.nanusam.mapper.FileMapper;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {
    private final GoodsMapper goodsMapper;
    private final FileMapper fileMapper;
    private final CodeMapper codeMapper;
    private final ModelMapper modelMapper;
    @Override
    public PageResponseDTO<GoodsDTO> listByPage(PageRequestDTO requestDTO) {
        List<GoodsDTO> list = goodsMapper.listByPage(requestDTO)
                .stream().map(vo -> modelMapper.map(vo, GoodsDTO.class)).collect(Collectors.toList());
        PageResponseDTO<GoodsDTO> responseDTO = PageResponseDTO.<GoodsDTO>withAll()
                .dtoList(list)
                .reqDTO(requestDTO)
                .total_count(goodsMapper.totalCount(requestDTO))
                .build();
        return responseDTO;
    }

    @Override
    public int totalCount() {
        return 0;
    }

    @Override
    public void regist(GoodsDTO goodsDTO) {
        GoodsVO goodsVO = modelMapper.map(goodsDTO, GoodsVO.class);
        goodsMapper.regist(goodsVO);
        log.info("idx="+goodsVO.getIdx());
        goodsDTO.setIdx(goodsVO.getIdx());
    }

    @Override
    public void fileupload(FileDTO fileDTO) {
        fileMapper.regist(modelMapper.map(fileDTO, FileVO.class));
    }

    @Override
    public GoodsDTO view(int idx) {
        GoodsDTO dto = modelMapper.map(goodsMapper.view(idx), GoodsDTO.class);
        dto.setImages(fileMapper.listByBbsCodeAndRefIdx("상품", idx).stream().map(vo->modelMapper.map(vo, FileDTO.class)).collect(Collectors.toList()));
        return dto;
    }

    @Override
    public List<CodeDTO> codeList(String type) {
        return codeMapper.list(type).stream().map(vo-> modelMapper.map(vo, CodeDTO.class)).collect(Collectors.toList());
    }

    @Override
    public List<FileDTO> fileListByBbsCodeAndRefIdx(String bbsCode, int refIdx) {
        return fileMapper.listByBbsCodeAndRefIdx(bbsCode, refIdx).stream().map(vo->modelMapper.map(vo, FileDTO.class)).collect(Collectors.toList());
    }

    @Override
    public void deleteFileByName(String name) {
        fileMapper.deleteByFileName(name);
    }
}
