package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.dto.MemberModifyDTO;
import net.fullstack7.nanusam.service.MemberService;
import net.fullstack7.nanusam.util.JSFunc;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/pwdCheck.do")
    public String pwdCheck() {
        return "myPage/pwdCheck";
    }

    @PostMapping("/pwdCheck.do")
    public String pwdCheck(@RequestParam String pwd, HttpSession session, Model model) {
        String memberId = (String) session.getAttribute("memberId");
        boolean pwdCheck = memberService.pwdCheck(memberId, pwd);
        if (pwdCheck) {
            session.setAttribute("isPwdChecked", true);
            return "redirect:/member/view.do";
        } else {
            model.addAttribute("errors", "비밀번호가 일치하지 않습니다.");
            return "/pwdCheck";
        }
    }

    @GetMapping("/view.do")
    public String viewGet(HttpSession session, Model model) {
        Boolean isPwdChecked = (Boolean) session.getAttribute("isPwdChecked");
        if (isPwdChecked == null || !isPwdChecked) {
            model.addAttribute("errors", "비밀번호 확인이 필요합니다.");
            return "myPage/pwdCheck";
        }
        String memberId = (String) session.getAttribute("memberId");
        MemberDTO memberDTO = memberService.viewMember(memberId);
//        log.info("회원정보확인"+ memberDTO);
        if (memberDTO != null) {
            model.addAttribute("memberDTO", memberDTO);
        } else {
            model.addAttribute("errors", "회원 정보를 불러올 수 없습니다.");
            return "myPage/pwdCheck";
        }
        return "myPage/view";
    }
//    @GetMapping("/modify.do")
//    public String modifyGet(){
//        return "member/modify";
//    }
    @PostMapping("/modify.do")
    public String modifyPost(@Valid MemberModifyDTO memberModifyDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
            ) {
//        log.info("회원수정 컨트롤러 시작");
        if (bindingResult.hasErrors()) {
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberModifyDTO);
            log.info("memberDTO: " + memberModifyDTO);
            log.info("errors: " +bindingResult.getAllErrors());
            return "redirect:/member/view.do";
        }
        int result = memberService.modifyMember(memberModifyDTO);
        if (result > 0) {
//            log.info("회원수정성공"+memberModifyDTO);
            model.addAttribute("memberDTO", memberModifyDTO);
            return "redirect:/member/view.do";
        }else {
//            log.info("회원수정실패"+memberModifyDTO);
            redirectAttributes.addFlashAttribute("errors", "회원정보수정실패");
        }
        return "redirect:/member/view.do";
    }
//    @GetMapping("delete.do")
//    public String deleteGet(HttpSession session, Model model){
//        String memberId = (String) session.getAttribute("memberId");
//        String resultMessage = memberService.deleteMember(memberId);
//        model.addAttribute("message", resultMessage);
//
//        return "severanceResult";
//    }
}
