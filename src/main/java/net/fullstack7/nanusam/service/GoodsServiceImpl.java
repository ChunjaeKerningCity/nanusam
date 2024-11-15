package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.FileVO;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.*;
import net.fullstack7.nanusam.mapper.CodeMapper;
import net.fullstack7.nanusam.mapper.FileMapper;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
    public PageResponseDTO<GoodsDTO> listWithPayInfo(PageRequestDTO requestDTO) {
        List<GoodsDTO> list = goodsMapper.listWithPayment(requestDTO)
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
    public String regist(GoodsDTO goodsDTO) {
        GoodsVO goodsVO = modelMapper.map(goodsDTO, GoodsVO.class);
        goodsMapper.regist(goodsVO);

        if(goodsVO.getIdx() < 1) return "다시 시도해주세요.";

        goodsDTO.setIdx(goodsVO.getIdx());
        return null;
    }

    @Override
    public String fileupload(FileDTO fileDTO) {
        int result = fileMapper.regist(modelMapper.map(fileDTO, FileVO.class));
        if(result < 1) {
            return "다시 시도해주세요.";
        }
        return null;
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
    public String deleteFileByName(String name) {
        int result = fileMapper.deleteByFileName(name);
        if(result < 1)
            return "다시 시도해주세요.";
        return null;
    }

    @Override
    public String modifyGoodsInfo(GoodsDTO goodsDTO) {

        int result = goodsMapper.modifyGoodsInfo(modelMapper.map(goodsDTO, GoodsVO.class));

        if(result < 1) {
            return "수정 권한이 없습니다.";
        }

        return null;
    }
}
