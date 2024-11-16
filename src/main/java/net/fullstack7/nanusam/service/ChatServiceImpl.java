package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.ChatGroupVO;
import net.fullstack7.nanusam.domain.ChatMessageVO;
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
        // DTO를 VO로 변환
        ChatMessageVO vo = modelMapper.map(dto, ChatMessageVO.class);

        // Mapper 호출
        chatMapper.messageRegist(vo);

        // 자동 생성된 idx를 VO에서 반환
        return vo.getIdx();
    }

    @Override
    public List<ChatGroupDTO> groupList(String memberId) {
        List<ChatGroupDTO> list = chatMapper.groupList(memberId).stream().map(vo->modelMapper.map(vo,ChatGroupDTO.class)).collect(Collectors.toList());
        for(ChatGroupDTO dto : list){
            ChatMessageVO chatMessageVO = chatMapper.getLastMessage(dto.getIdx());
            if(chatMessageVO == null){
                continue;
            }
            dto.setLastMessage(modelMapper.map(chatMessageVO,ChatMessageDTO.class));
            dto.setUnreadCount(chatMapper.countUnreadMessages(dto.getIdx(),memberId));
        }
        return list;
    }

    @Override
    public List<ChatGroupDTO> groupDTOList(String memberId) {
        List<ChatGroupDTO> list = chatMapper.groupDTOList(memberId);
        for(ChatGroupDTO dto : list){
            ChatMessageVO chatMessageVO = chatMapper.getLastMessage(dto.getIdx());
            if(chatMessageVO == null){
                continue;
            }
            dto.setLastMessage(modelMapper.map(chatMessageVO,ChatMessageDTO.class));
            dto.setUnreadCount(chatMapper.countUnreadMessages(dto.getIdx(),memberId));
        }
        return list;
    }

    @Override
    public int updateRecentDate(int idx) {
        return chatMapper.updateRecentDate(idx);
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
    public Integer getGroupIdx(int goodsIdx, String customer) {
        if(chatMapper.getGroupIdx(goodsIdx, customer)==null){
            return -1;
        }
        return chatMapper.getGroupIdx(goodsIdx, customer);
    }

    @Override
    public ChatGroupDTO getGroup(int groupIdx) {
        return modelMapper.map(chatMapper.getGroup(groupIdx),ChatGroupDTO.class);
    }

    @Override
    public ChatGroupDTO getGroupDTO(int groupIdx) {
        return chatMapper.getGroupDTO(groupIdx);
    }



    @Override
    public int deleteGroup(int groupIdx) {
        return chatMapper.deleteGroup(groupIdx);
    }

    @Override
    public int readMessages(int groupIdx, String memberId) {
        return chatMapper.readMessages(groupIdx, memberId);
    }

    @Override
    public ChatMessageDTO getMessage(int idx) {
        return modelMapper.map(chatMapper.getMessage(idx),ChatMessageDTO.class);
    }

    @Override
    public int countUnreadMessages(int groupIdx, String memberId) {
        return chatMapper.countUnreadMessages(groupIdx, memberId);
    }



}
