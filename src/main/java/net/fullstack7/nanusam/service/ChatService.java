package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.ChatDTO;

import java.util.List;

public interface ChatService {
    public void regist(ChatDTO dto);
    public List<ChatDTO> getList(String memberId);
    public void deleteMessages(List<Integer> idxList);
}
