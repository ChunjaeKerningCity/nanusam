package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.service.MemberService;
import net.fullstack7.nanusam.util.JSFunc;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

    @GetMapping("/login.do")
    public String login(HttpSession session){
        if(session.getAttribute("memberId") != null){
            return "redirect:/";
        }
        return "login/login";
    }
    @PostMapping("/login.do")
    public String login(@RequestParam("memberId") String memberId,
                        @RequestParam("pwd") String pwd,
                        HttpSession session, Model model) {
        MemberDTO memberDTO = memberService.login(memberId, pwd);
        if (memberDTO != null) {
            session.setAttribute("memberId", memberDTO.getMemberId());
            session.setAttribute("memberName", memberDTO.getName());
            return "redirect:/";
        } else {
            model.addAttribute("errors", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/login";
        }
    }
    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/list.do")
    public String list() {
        return "member/list";
    }
    // 가입전 약관동의
    @GetMapping("/registCheck.do")
    public String registCheck(
            HttpServletResponse res,
            HttpSession session) throws IOException {
        String loginCheck = (String) session.getAttribute("memberId");
        if (loginCheck != null) {
            String alertMessage = "이미 로그인된 상태입니다. 회원가입 페이지에 접근할 수 없습니다.";
            String redirectUrl = "/";
            res.setCharacterEncoding("UTF-8");
            res.setContentType("text/html;charset=UTF-8");
            PrintWriter out = res.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('" + alertMessage + "');");
            out.println("window.location.href = '" + redirectUrl + "';");
            out.println("</script>");
            out.flush();
            return null;
        }
        Boolean termsAgree = (Boolean) session.getAttribute("termsAgree");
        if (termsAgree != null && termsAgree) {
            return "login/regist";
        }
        return "login/registCheck";
    }

    @PostMapping("/registCheck.do")
    public String registCheck(@RequestParam(value = "termsAgreement", defaultValue = "false") boolean termsAgreement, HttpSession session, Model model) {
        if (termsAgreement) {
            session.setAttribute("termsAgree", true);
            return "login/regist";
        } else {
            model.addAttribute("errors", "약관동의 후 회원가입이 가능합니다");
            return "login/registCheck";
        }
    }

    @GetMapping("/regist.do")
    public String registGet(HttpSession session,
                            HttpServletResponse res,
                            Model model) throws IOException {
        Boolean termsAgree = (Boolean) session.getAttribute("termsAgree");
        String loginCheck = (String) session.getAttribute("memberId");
        if(loginCheck != null){
            res.setCharacterEncoding("UTF-8");
            String alertMessage = "이미 로그인된 상태입니다. 회원가입 페이지에 접근할 수 없습니다.";
            String redirectUrl = "/";
            res.setContentType("text/html;charset=UTF-8");
            PrintWriter out = res.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('" + alertMessage + "');");
            out.println("window.location.href = '" + redirectUrl + "';");
            out.println("</script>");
            out.flush();
            return null;
        }
        if (termsAgree == null || !termsAgree) {
            model.addAttribute("errors", "약관에 동의한 후 회원가입이 가능합니다.");
            return "forward:/member/registCheck.do";
        }
        return "login/regist";
    }

    // 아이디 중복체크
    @PostMapping("/memberIdCheck.do")
    @ResponseBody
    public String checkMemberId(@RequestParam String memberId) {
        boolean available = memberService.memberIdCheck(memberId);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("available", available);
        return jsonResponse.toString();
    }

    @PostMapping("/regist.do")
    public String registPost(@Valid MemberDTO memberDTO
                             , BindingResult bindingResult
                             , RedirectAttributes redirectAttributes
                             , Model model) {
        if(bindingResult.hasErrors()){
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/regist.do";
        }
        int result = memberService.registMember(memberDTO);
        if (result > 0) {
            return "redirect:/member/login.do";
        } else {
            model.addAttribute("errors", "회원가입에 실패했습니다.");
            return "login/regist";
        }
    }
    @GetMapping("/view.do")
    public String viewGet(){
        return "member/view";
    }
    @GetMapping("/modify.do")
    public String modifyGet(){
        return "member/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(){
        return "member/modify";
    }
    @GetMapping("delete.do")
    public String deleteGet(){
        return "member/delete";
    }
}
