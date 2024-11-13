package net.fullstack7.nanusam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/review")
@Controller
public class ReviewController {
    @GetMapping("/test.do")
    public String test(Model model) {
        model.addAttribute("errors","메세지");
        return "review/test";
    }
}
