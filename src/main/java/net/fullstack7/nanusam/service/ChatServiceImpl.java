package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.ChatVO;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.mapper.ChatMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
    private final ChatMapper chatMapper;
    private final ModelMapper modelMapper;
    @Override
    public void regist(ChatDTO dto) {
        chatMapper.regist(modelMapper.map(dto, ChatVO.class));
    }

    @Override
    public List<ChatDTO> getList(String memberId) {
        return chatMapper.getList(memberId).stream().map(vo->modelMapper.map(vo,ChatDTO.class)).collect(Collectors.toList());
    }

    @Override
    public void deleteMessages(List<Integer> idxList) {

    }
}
