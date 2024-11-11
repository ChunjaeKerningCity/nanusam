package net.fullstack7.nanusam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @GetMapping("/main.do")
    public String chatMain() {
        return "chat/multiChatMain";
    }
    @GetMapping("/window.do")
    public String chatWindow(@RequestParam String chatId, Model model) {
        model.addAttribute("chatId", chatId);
        return "chat/chatWindow";
    }
    @GetMapping("/list.do")
    public String chatList() {
        return "chat/list";
    }
    @GetMapping("/view.do")
    public String chatRegist() {
        return "chat/view";
    }
}
