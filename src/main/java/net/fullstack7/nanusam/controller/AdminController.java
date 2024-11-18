package net.fullstack7.nanusam.controller;

import java.lang.reflect.Member;
import java.util.List;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.AdminDTO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.service.AdminService;
import net.fullstack7.nanusam.service.BbsService;
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
    private final MemberService memberService;
    private final BbsService bbsService;

    @GetMapping("/login.do")
    public String adminLogin() {
        return "admin/adminLogin";
    }

    @GetMapping("/logout.do")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
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
    public String adminMain(Model model) {
        int totalMemberCount = adminService.getTotalMemberCount();
        int totalGoodsCount = adminService.getTotalGoodsCount();


        model.addAttribute("totalMemberCount", totalMemberCount);
        model.addAttribute("totalGoodsCount", totalGoodsCount);

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

//    @PostMapping("/deleteMember.do")
//    public String deleteMember(@RequestParam("memberId") String memberId,
//        RedirectAttributes redirectAttributes) {
//        boolean insertedToSecession = adminService.insertSecessionMember(memberId);
//        if (insertedToSecession) {
//            boolean deleted = adminService.deleteMember(memberId);
//            if (deleted) {
//                redirectAttributes.addFlashAttribute("errors", "회원이 성공적으로 삭제되었습니다.");
//            } else {
//                redirectAttributes.addFlashAttribute("errors", "회원 삭제에 실패했습니다.");
//            }
//        } else {
//            redirectAttributes.addFlashAttribute("errors", "회원 정보를 탈퇴 테이블에 삽입하는 데 실패했습니다.");
//        }
//        return "redirect:/admin/memberMm.do";
//    }

    @GetMapping("/noticeMm.do")
    public String noticeList(Model model) {
        List<BbsDTO> noticeList = adminService.noticeList();
        model.addAttribute("noticeList", noticeList);
        return "admin/adminNoticeManagement";
    }

    @GetMapping("/goodsMm.do")
    public String goodsList(Model model) {
        List<GoodsDTO> goodsList = adminService.goodsList();
        model.addAttribute("goodsList", goodsList);
        return "admin/adminGoodsManagement";
    }

    @PostMapping("/deleteGoods.do")
    public String deleteGoods(@RequestParam("idx") int idx, RedirectAttributes redirectAttributes) {
        boolean deleted = adminService.deleteGoods(idx);
        if (deleted) {
            redirectAttributes.addFlashAttribute("errors", "상품이 성공적으로 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errors", "상품 삭제에 실패했습니다.");
        }
        return "redirect:/admin/goodsMm.do";
    }

    @PostMapping("/updateGoodsStatus.do")
    public String updateGoodsStatus(@RequestParam("idx") int idx, @RequestParam("status") String status, RedirectAttributes redirectAttributes) {
        boolean updated = adminService.updateGoodsStatus(idx, status);
        if (updated) {
            redirectAttributes.addFlashAttribute("errors", "상품 상태가 성공적으로 변경되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errors", "상품 상태 변경에 실패했습니다.");
        }
        return "redirect:/admin/goodsMm.do";
    }

    @PostMapping("/deleteMember.do")
    public String deleteMember(@RequestParam String memberId, RedirectAttributes redirectAttributes, HttpSession session) {
        if (memberService.dontDelete(memberId)) {
            redirectAttributes.addFlashAttribute("errors", "탈퇴가 불가합니다. 현재 예약 중이거나 배송 중인 상품이 있습니다.");
            return "redirect:/admin/memberMm.do";
        }

        memberService.goDelete(memberId);
        redirectAttributes.addFlashAttribute("errors", "탈퇴가 완료되었습니다.");
        session.invalidate();
        return "redirect:/admin/memberMm.do";
    }
}
