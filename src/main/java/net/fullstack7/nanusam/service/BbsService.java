package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BbsService {
    public int totalCount();
    public List<BbsDTO> list();
    public PageResponseDTO<BbsDTO> listByPage(PageRequestDTO requestDTO);

    public BbsDTO view(int idx);
    void regist(BbsDTO dto);
    void modify(BbsDTO dto);


    void delete(int idx);
    void addReadCnt(int idx);
}
