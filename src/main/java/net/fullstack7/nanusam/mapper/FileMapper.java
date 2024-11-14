package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.FileVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import java.util.List;

@Mapper
public interface FileMapper {
    int regist(FileVO fileVO);
    FileVO view(int idx);
    List<FileVO> listByBbsCodeAndRefIdx(@Param("bbsCode") String bbsCode, @Param("refIdx") int refIdx);
    int deleteByBbsCodeAndRefIdx(String bbsCode, int refIdx);
    int deleteByFileName(String fileName);
}
