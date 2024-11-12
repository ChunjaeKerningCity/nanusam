package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.ChatDTO;
import net.fullstack7.nanusam.dto.ChatGroupDTO;
import net.fullstack7.nanusam.dto.ChatMessageDTO;
import net.fullstack7.nanusam.service.ChatService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
    private final ChatService chatService;
    @GetMapping("/login.do")
    public String login(@RequestParam String memberId,HttpSession session,Model model) {
        session.setAttribute("memberId", memberId);
        return "/chat/fromGoods";
    }
    @GetMapping("/list.do")
    public String chatList(HttpSession session, Model model) {
        log.info("chatList");
        if(session == null || session.getAttribute("memberId") == null) {
            log.info("session is null");
            return "redirect:/main.do";
        }
        List<ChatGroupDTO> chatList = chatService.groupList((String)session.getAttribute("memberId"));
        model.addAttribute("chatList", chatList);
        return "chat/list";
    }
    @GetMapping("/view.do")
    public String chatView(@RequestParam int groupIdx, HttpSession session, Model model) {
        log.info("chatView");
        if(session == null || session.getAttribute("memberId") == null) {
            log.info("session is null");
            return "redirect:/main.do";
        }
        String memberId = (String)session.getAttribute("memberId");
        int readResult = chatService.readMessages(groupIdx, memberId);
        if(readResult <= 0) {
            log.info("readMessages failed");
        }
        List<ChatMessageDTO> chatMessageList = chatService.messageList(groupIdx);
        ChatGroupDTO chatGroupDTO = chatService.getGroup(groupIdx);
        model.addAttribute("sender", chatGroupDTO.getSeller().equals(memberId)?chatGroupDTO.getCustomer():chatGroupDTO.getSeller());
        model.addAttribute("chatMessageList", chatMessageList);
        model.addAttribute("groupIdx", groupIdx);
        return "chat/view";
    }
    @GetMapping("/fromGoods.do")
    public String chatFromGoods(@RequestParam int goodsIdx, @RequestParam String seller, HttpSession session, Model model) {
        log.info("chatFromGoods");
        if(session == null || session.getAttribute("memberId") == null) {
            log.info("session is null");
            return "redirect:/main.do";
        }
        String customer = (String) session.getAttribute("memberId");

        if(customer.equals(seller)) {
            log.info("customer is seller");
            return "redirect:/goods/view.do?goodsIdx="+goodsIdx;
        }

        int result = chatService.getGroupIdx(goodsIdx,customer);
        if(result>0){
            log.info("채팅방이 이미 존재함");
            return "forward:/chat/view.do?groupIdx="+result;
        }

        result = chatService.groupRegist(ChatGroupDTO.builder().seller(seller).customer(customer).goodsIdx(goodsIdx).build());
        if(result<0){
            model.addAttribute("errors","채팅방 생성실패");
            log.info("채팅방 생성 실패");
            return "redirect:/main.do";
        }
        int groupIdx = chatService.getGroupIdx(goodsIdx,customer);
        log.info("새로생성한 그룹 번호 : " + groupIdx);
        return "forward:/chat/view.do?groupIdx="+groupIdx;
    }
}
