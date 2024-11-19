package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.ReadCntDTO;

public interface ReadCntService {
    public boolean contains(String memberId, String bbsNo, int bbsIdx);
    public int regist(ReadCntDTO dto);
}
