package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.FileVO;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.dto.FileDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
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
}
