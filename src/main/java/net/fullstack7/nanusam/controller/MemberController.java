package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/login.do")
    public String login(){
        return "login/login";
    }
    @PostMapping("/login.do")
    public String login(@RequestParam("memberId") String memberId,
                        @RequestParam("pwd") String pwd,
                        HttpSession session, Model model) {
        boolean loginOk = memberService.login(memberId, pwd);
        log.info("loginOk" + loginOk);
        if (loginOk) {
            session.setAttribute("memberId", memberId);
            return "/main";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/login";
        }
    }
    @GetMapping("/list.do")
    public String list() {
        return "member/list";
    }
    // 가입전 약관동의
    @GetMapping("/registCheck.do")
    public String registCheck(){
        return "login/registCheck";
    }

    @PostMapping("/registCheck.do")
    public String registCheck(@RequestParam(value = "termsAgreement", defaultValue = "false") boolean termsAgreement, Model model) {
        if (termsAgreement) {
            return "login/regist";
        } else {
            model.addAttribute("errors", "약관동의 후 회원가입이 가능합니다");
            return "login/registCheck";
        }
    }

    @GetMapping("/memberIdCheck.do")
    @ResponseBody
    public String memberIdCheck(@RequestParam("memberId") String memberId) {
        boolean isDuplicate = memberService.memberIdCheck(memberId);
        if (isDuplicate) {
            return "아이디가 중복되었습니다.";
        } else {
            return "사용 가능한 아이디입니다.";
        }
    }

    @GetMapping("/regist.do")
    public String registGet(){
        return "login/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(){
        return "member/list";
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
