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
        log.info("===================================");
        log.info("BbsServiceImpl >> list() START");

        List<BbsVO> voList = bbsMapper.list();
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo, BbsDTO.class))
                .collect(Collectors.toList());

        log.info("voList = " + voList);
        log.info("dtoList = " + dtoList);
        log.info("BbsServiceImpl >> list() END");
        log.info("===================================");
        return dtoList;
    }

    @Override
    public PageResponseDTO<BbsDTO> listByPage(PageRequestDTO pageRequestDTO){
        log.info("===================================");
        log.info("BbsServiceImpl >> listByPage() START");

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

        log.info("voList = " + voList);
        log.info("dtoList = " + dtoList);
        log.info("BbsServiceImpl >> listByPage() END");
        log.info("===================================");
        return pageResponseDTO;
    }

    @Override
    public BbsDTO view(int idx){
        return null;
    }

    @Override
    public void regist(BbsDTO dto){}

    @Override
    public void modify(BbsDTO dto){}

    @Override
    public void delete(int idx){}

    @Override
    public void addReadCnt(int idx){}
}
