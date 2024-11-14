package net.fullstack7.nanusam.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.AdminDTO;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.service.AdminService;
import net.fullstack7.nanusam.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

    @GetMapping("/memberMm.do")
    public String memberList(Model model) {
        List<AdminDTO> memberList = adminService.memberList();
        model.addAttribute("memberList", memberList);
        return "admin/adminMemberManagement";
    }

    @PostMapping("/updateMemberStatus.do")
    public String updateMemberStatus(@RequestParam("memberId") String memberId,
        @RequestParam("status") String status,
        RedirectAttributes redirectAttributes) {
        boolean updated = adminService.updateMemberStatus(memberId, status);
        if (updated) {
            redirectAttributes.addFlashAttribute("errors", "회원 상태가 성공적으로 변경되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errors", "회원 상태를 변경할 수 없습니다. 상품 상태를 확인하세요.");
        }
        return "redirect:/admin/memberMm.do";
    }

    @PostMapping("/deleteMember.do")
    public String deleteMember(@RequestParam("memberId") String memberId,
        RedirectAttributes redirectAttributes) {
        boolean insertedToSecession = adminService.insertSecessionMember(memberId);
        if (insertedToSecession) {
            boolean deleted = adminService.deleteMember(memberId);
            if (deleted) {
                redirectAttributes.addFlashAttribute("errors", "회원이 성공적으로 삭제되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("errors", "회원 삭제에 실패했습니다.");
            }
        } else {
            redirectAttributes.addFlashAttribute("errors", "회원 정보를 탈퇴 테이블에 삽입하는 데 실패했습니다.");
        }
        return "redirect:/admin/memberMm.do";
    }
}
