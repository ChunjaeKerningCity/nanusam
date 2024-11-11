package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.ChatVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    public void regist(ChatVO vo);
    public List<ChatVO> getList(String memberId);
    public void deleteMessages(List<Integer> idxList);
}
