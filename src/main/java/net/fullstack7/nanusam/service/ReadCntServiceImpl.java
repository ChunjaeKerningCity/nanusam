package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.ReadCntVO;
import net.fullstack7.nanusam.dto.ReadCntDTO;
import net.fullstack7.nanusam.mapper.ReadCntMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
@Log4j2
@Service
@RequiredArgsConstructor
public class ReadCntServiceImpl implements ReadCntService {
    private final ReadCntMapper readCntMapper;
    private final ModelMapper modelMapper;
    @Override
    public boolean contains(String memberId, String bbsNo, int bbsIdx) {
        return readCntMapper.contains(memberId,bbsNo,bbsIdx) != null;
    }

    @Override
    public int regist(ReadCntDTO dto) {
        if(contains(dto.getMemberId(), dto.getBbsNo(), dto.getBbsIdx())) {
            return -1;
        }
        return readCntMapper.regist(modelMapper.map(dto, ReadCntVO.class));
    }
}
