package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.ChatGroupVO;
import net.fullstack7.nanusam.domain.ChatMessageVO;
import net.fullstack7.nanusam.domain.ChatVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChatMapper {
    public int groupRegist(ChatGroupVO vo);
    public int messageRegist(ChatMessageVO vo);
    public List<ChatGroupVO> groupList(@Param("memberId")String memberId);
    public List<ChatMessageVO> messageList(@Param("groupIdx")int groupIdx);
    public ChatMessageVO getLastMessage(@Param("groupIdx")int groupIdx);
    public int getGroupIdx(@Param("goodsIdx") int goodsIdx, @Param("customer") String customer);


}
