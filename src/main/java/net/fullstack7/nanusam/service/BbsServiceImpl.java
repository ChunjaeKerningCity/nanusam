package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsService {
    private final BbsMapper bbsMapper;
    private final ModelMapper modelMapper;

    @Override
    public int totalCount(){
        return 0;
    }

    @Override
    public List<BbsDTO> list(){
//        log.info("===================================");
//        log.info("BbsServiceImpl >> list() START");

        List<BbsVO> voList = bbsMapper.list();
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, BbsDTO.class))
                .collect(Collectors.toList());

//        log.info("voList = " + voList);
//        log.info("dtoList = " + dtoList);
//        log.info("BbsServiceImpl >> list() END");
//        log.info("===================================");
        return dtoList;
    }

    @Override
    public PageResponseDTO<BbsDTO> listByPage(PageRequestDTO pageRequestDTO){
//        log.info("===================================");
//        log.info("BbsServiceImpl >> listByPage() START");
//        log.info("page_no = " + pageRequestDTO.getPage_no());
//        log.info("page_size = " + pageRequestDTO.getPage_size());
//        log.info("page_skip = " + pageRequestDTO.getPage_skip_count());
//        log.info("page_block = " + pageRequestDTO.getPage_block_size());

        List<BbsVO> voList = bbsMapper.listByPage(pageRequestDTO);
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, BbsDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.totalCount();

        PageResponseDTO<BbsDTO> pageResponseDTO = PageResponseDTO.<BbsDTO>withAll()
                .reqDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

//        log.info("voList = " + voList);
//        log.info("dtoList = " + dtoList);
//        log.info("BbsServiceImpl >> listByPage() END");
//        log.info("===================================");
        return pageResponseDTO;
    }

    @Override
    public BbsDTO view(int idx){
//        log.info("=================================================");
//        log.info("BbsServiceImpl >> view() START");

        BbsVO vo = bbsMapper.view(idx);
        BbsDTO dto = modelMapper.map(vo, BbsDTO.class);

//        log.info("idx=" +idx);
//        log.info("vo=" +vo);
//        log.info("dto=" +dto);
//        log.info("BbsServiceImpl >> view() END");
//        log.info("=================================================");
        return dto;
    }

    @Override
    public void regist(BbsDTO dto){
        BbsVO vo = modelMapper.map(dto, BbsVO.class);
        bbsMapper.regist(vo);

//        log.info("===================================");
//        log.info("BbsServiceImpl >> regist() START");
//        log.info("vo = " + vo);
//        log.info("BbsServiceImpl >> regist() END");
//        log.info("===================================");
    }

    @Override
    public void modify(BbsDTO dto){
        BbsVO vo = modelMapper.map(dto, BbsVO.class);
        bbsMapper.modify(vo);
    }

    @Override
    public void delete(int idx){
        bbsMapper.delete(idx);
    }

    @Override
    public void addReadCnt(int idx){
    }
}
