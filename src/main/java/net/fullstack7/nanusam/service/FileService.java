package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.FileDTO;

import java.util.List;

public interface FileService {
    void regist(FileDTO fileDTO);
    FileDTO view(int idx);
    List<FileDTO> listByBbsCodeAndRefIdx(String bbsCode, int refIdx);
    void deleteByBbsCodeAndRefIdx(String bbsCode, int refIdx);
}
