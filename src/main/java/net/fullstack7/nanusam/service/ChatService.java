package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.ChatGroupDTO;
import net.fullstack7.nanusam.dto.ChatMessageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface ChatService {
    public int groupRegist(ChatGroupDTO dto);
    public int messageRegist(ChatMessageDTO dto);
    public List<ChatGroupDTO> groupList(String memberId);
    public List<ChatMessageDTO> messageList(int groupIdx);
    public ChatMessageDTO getLastMessage(int groupIdx);
    public Integer getGroupIdx(int goodsIdx, String customer);
    public ChatGroupDTO getGroup(int groupIdx);
    public int deleteGroup(int groupIdx);
    public int readMessages(int groupIdx, String memberId);
    public ChatMessageDTO getMessage(int idx);
    public int countUnreadMessages(int groupIdx, String memberId);
    public ChatGroupDTO getGroupDTO(int groupIdx);
    public List<ChatGroupDTO> groupDTOList(String memberId);
}
