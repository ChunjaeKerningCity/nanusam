package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.ChatGroupVO;
import net.fullstack7.nanusam.domain.ChatMessageVO;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.dto.ChatGroupDTO;
import net.fullstack7.nanusam.dto.ChatMessageDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
public interface ChatService {
    public int groupRegist(ChatGroupDTO dto);
    public int messageRegist(ChatMessageDTO dto);
    public List<ChatGroupDTO> groupList(String memberId);
    public List<ChatMessageDTO> messageList(int groupIdx);
    public ChatMessageDTO getLastMessage(int groupIdx);
    public int getGroupIdx(int goodsIdx, String customer);
}
