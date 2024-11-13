package net.fullstack7.nanusam.controller;

import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.AdminService;
import net.fullstack7.nanusam.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/admin")
public class AdminController {
    private final AdminService adminService;

    @GetMapping("/login.do")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @PostMapping("/login.do")
    public String login(@RequestParam("memberId") String memberId,
        @RequestParam("pwd") String pwd,
        HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        boolean adminLoginOK = adminService.adminLogin(memberId, pwd);
        model.addAttribute("success", true);
        log.info("adminLogin" + adminLoginOK);
        if (adminLoginOK) {
            session.setAttribute("memberId", memberId);
            return "redirect:/admin/main.do";
        } else {
            model.addAttribute("errors", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "/admin/adminLogin";
        }
    }

    @GetMapping("/main.do")
    public String adminMain() {
        return "admin/adminMain";
    }
}
