package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.ChatGroupVO;
import net.fullstack7.nanusam.domain.ChatMessageVO;
import net.fullstack7.nanusam.domain.ChatVO;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.dto.ChatGroupDTO;
import net.fullstack7.nanusam.dto.ChatMessageDTO;
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
    public int groupRegist(ChatGroupDTO dto) {
        return chatMapper.groupRegist(modelMapper.map(dto, ChatGroupVO.class));
    }

    @Override
    public int messageRegist(ChatMessageDTO dto) {
        return chatMapper.messageRegist(modelMapper.map(dto, ChatMessageVO.class));
    }

    @Override
    public List<ChatGroupDTO> groupList(String memberId) {
        List<ChatGroupDTO> list = chatMapper.groupList(memberId).stream().map(vo->modelMapper.map(vo,ChatGroupDTO.class)).collect(Collectors.toList());
        for(ChatGroupDTO dto : list){
            dto.setLastMessage(modelMapper.map(chatMapper.getLastMessage(dto.getIdx()),ChatMessageDTO.class));
        }
        return list;
    }

    @Override
    public List<ChatMessageDTO> messageList(int groupIdx) {
        return chatMapper.messageList(groupIdx).stream().map(vo->modelMapper.map(vo,ChatMessageDTO.class)).collect(Collectors.toList());
    }

    @Override
    public ChatMessageDTO getLastMessage(int groupIdx) {
        return modelMapper.map(chatMapper.getLastMessage(groupIdx),ChatMessageDTO.class);
    }

    @Override
    public int getGroupIdx(int goodsIdx, String customer) {
        return chatMapper.getGroupIdx(goodsIdx, customer);
    }

}
