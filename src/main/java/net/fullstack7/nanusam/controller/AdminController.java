package net.fullstack7.nanusam.controller;

import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/admin")
public class AdminController {
    private final MemberService memberService;

    @GetMapping("/login.do")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @GetMapping("/main.do")
    public String adminMain() { return "admin/adminMain"; }
}
