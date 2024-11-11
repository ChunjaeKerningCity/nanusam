package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.mapper.ChatMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
    private final ChatMapper chatMapper;

    @Override
    public void regist(ChatDTO dto) {

    }

    @Override
    public List<ChatDTO> getList(String memberId) {
            return null;
    }
}
