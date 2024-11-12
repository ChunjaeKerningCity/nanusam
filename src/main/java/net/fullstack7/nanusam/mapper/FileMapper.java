package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.FileVO;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

public interface FileMapper {
    void regist(FileVO fileVO);
    FileVO view(int idx);
    List<FileVO> listByBbsCodeAndRefIdx(String bbsCode, int refIdx);
    void deleteByBbsCodeAndRefIdx(String bbsCode, int refIdx);
}
