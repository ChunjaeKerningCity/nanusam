package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
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

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
    private final ChatService chatService;
    @GetMapping("/list.do")
    public String chatList(HttpSession session, Model model) {
        if(session == null || session.getAttribute("memberId") == null) {
            return "redirect:/main.do";
        }
        List<ChatGroupDTO> chatList = chatService.groupList((String)session.getAttribute("memberId"));
        model.addAttribute("chatList", chatList);
        return "chat/list";
    }
    @GetMapping("/view.do")
    public String chatView(@RequestParam int groupIdx, HttpSession session, Model model) {
        if(session == null || session.getAttribute("memberId") == null) {
            return "redirect:/main.do";
        }
        List< ChatMessageDTO> chatMessageList = chatService.messageList(groupIdx);
        model.addAttribute("chatMessageList", chatMessageList);
        return "chat/view";
    }
    @GetMapping("/fromGoods.do")
    public String chatViewFirst(@RequestParam int goodsIdx, HttpSession session, Model model) {
        if (session == null || session.getAttribute("memberId") == null) {
            return "redirect:/main.do";
        }
        String customer = (String) session.getAttribute("memberId");
        int result = chatService.getGroupIdx(goodsIdx, customer);
        if (result > 0) {
            return "forward:/chat/view.do?groupIdx=" + result;
        }
        return null;
    }
}
