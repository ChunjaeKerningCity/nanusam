package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.ReadCntVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReadCntMapper {
    public ReadCntVO contains(@Param("memberId") String memberId,@Param("bbsNo") String bbsNo,@Param("bbsIdx") int bbsIdx);
    public int regist(ReadCntVO readCntVO);
}
