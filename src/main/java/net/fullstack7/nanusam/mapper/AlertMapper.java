package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.AlertVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AlertMapper {
    public int regist(AlertVO vo);
    public List<AlertVO> listWithPage(@Param("memberId")String memberId, @Param("dto")PageRequestDTO dto);
    int totalCount(@Param("memberId")String memberId);
    public int modify(AlertVO vo);
    public Integer unreadCount(@Param("memberId")String memberId);
    public int modifyStatus(@Param("memberId")String memberId);
}
