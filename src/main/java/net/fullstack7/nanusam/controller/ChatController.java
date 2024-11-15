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
            model.addAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/";
        }
        String memberId = (String)session.getAttribute("memberId");
        List<ChatGroupDTO> chatList = chatService.groupList((String)session.getAttribute("memberId"));
        model.addAttribute("chatList", chatList);
        return "chat/list";
    }
    @GetMapping("/view.do")
    public String chatView(@RequestParam int groupIdx, HttpSession session, Model model) {
        log.info("chatView");
        if(session == null || session.getAttribute("memberId") == null) {
            model.addAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/";
        }
        String memberId = (String)session.getAttribute("memberId");
        int readResult = chatService.readMessages(groupIdx, memberId);
        if(readResult <= 0) {
            model.addAttribute("errors","메시지 불러오기 실패.");
            log.info("readMessages failed");
        }
        ChatGroupDTO chatGroupDTO = chatService.getGroup(groupIdx);
        if(chatGroupDTO == null) {
            model.addAttribute("errors","채팅방 불러오기 실패.");
            log.info("chatGroupDTO is null");
        }
        List<ChatMessageDTO> chatMessageList = chatService.messageList(groupIdx);
        model.addAttribute("other", chatGroupDTO.getSeller().equals(memberId)?chatGroupDTO.getCustomer():chatGroupDTO.getSeller());
        model.addAttribute("seller", chatGroupDTO.getSeller());
        model.addAttribute("goodsIdx", chatGroupDTO.getGoodsIdx());
        model.addAttribute("chatMessageList", chatMessageList);
        model.addAttribute("groupIdx", groupIdx);
        return "chat/view";
    }
    @GetMapping("/fromGoods.do")
    public String chatFromGoods(@RequestParam int goodsIdx, @RequestParam String seller, HttpSession session, Model model) {
        log.info("chatFromGoods");
        if(session == null || session.getAttribute("memberId") == null) {
            model.addAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/";
        }
        String customer = (String) session.getAttribute("memberId");

        if(customer.equals(seller)) {
            model.addAttribute("errors","자기자신과 채팅방 생성 불가");
            log.info("customer is seller");
            return "redirect:/goods/view.do?goodsIdx="+goodsIdx;
        }

        int result = chatService.getGroupIdx(goodsIdx,customer);
        if(result>0){
            log.info("채팅방이 이미 존재함");
            return "forward:/chat/view.do?groupIdx="+result;
        }

        result = chatService.groupRegist(ChatGroupDTO.builder().seller(seller).customer(customer).goodsIdx(goodsIdx).build());
        if(result<=0){
            model.addAttribute("errors","채팅방 생성실패");
            log.info("채팅방 생성 실패");
            return "redirect:/";
        }
        int groupIdx = chatService.getGroupIdx(goodsIdx,customer);
        log.info("새로생성한 그룹 번호 : " + groupIdx);
        return "forward:/chat/view.do?groupIdx="+groupIdx;
    }

    @GetMapping("/deleteGroup.do")
    public String deleteGroup(@RequestParam int groupIdx, HttpSession session, Model model) {
        log.info("deleteGroup");
        if(session == null || session.getAttribute("memberId") == null) {
            log.info("session is null");
            return "redirect:/";
        }

        int result = chatService.deleteGroup(groupIdx);
        if(result<=0){
            model.addAttribute("errors","채팅방 삭제실패");
            log.info("채팅방삭제실패");
            return "redirect:/chat/view.do?groupIdx="+groupIdx;
        }
        log.info("채팅방삭제성공");
        return "redirect:/chat/list.do";
    }
}
