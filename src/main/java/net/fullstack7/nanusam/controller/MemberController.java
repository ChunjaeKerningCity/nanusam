package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.service.MemberService;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
        boolean loginOk = memberService.login(memberId, pwd);
        log.info("loginOk" + loginOk);
        if (loginOk) {
            session.setAttribute("memberId", memberId);
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
    public String registCheck(HttpSession session) {
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

    @PostMapping
    @ResponseBody
  



    @GetMapping("/regist.do")
    public String registGet(HttpSession session, Model model) {
        Boolean termsAgree = (Boolean) session.getAttribute("termsAgree");
        if (termsAgree == null || !termsAgree) {
            model.addAttribute("errors", "약관에 동의한 후 회원가입이 가능합니다.");
            return "forward:/member/registCheck.do";
        }
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
