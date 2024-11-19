package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.service.MemberService;
import net.fullstack7.nanusam.util.CommonUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/login")
public class LoginController {
    private final MemberService memberService;

    @GetMapping("/login.do")
    public String login(HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) throws IOException {
        if(session.getAttribute("memberId") != null){
            redirectAttributes.addFlashAttribute("errors", "이미 로그인된 상태입니다. 회원가입 페이지에 접근할 수 없습니다.");
            return "redirect:/";
        }

        String referer = request.getHeader("referer");
        String refererUri = referer != null ? CommonUtil.urlToUri(referer) : "";

        if (refererUri != null && !refererUri.isEmpty()) {
            refererUri = URLEncoder.encode(URLEncoder.encode(refererUri, "UTF-8"), "UTF-8"); // 두 번 인코딩
            session.setAttribute("redirectAfterLogin", refererUri);
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
            //----------------------------
            String redirectURL = (String) session.getAttribute("redirectAfterLogin");

            if (redirectURL != null) {
                if(redirectURL.contains("/login/regist")){
                    return "redirect:/";
                }
                try {
                    session.removeAttribute("redirectAfterLogin");
                    return "redirect:" + URLDecoder.decode(URLDecoder.decode(redirectURL, "UTF-8"), "UTF-8");
                }catch(Exception e){
                    log.error(e);
                }
            }
            //----------------------------
            return "redirect:/";
        } else {
            model.addAttribute("errors", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/login";
        }
    }
    @GetMapping("/logout.do")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("errors", "로그아웃 되었습니다.");
        return "redirect:/";
    }

//    @GetMapping("/list.do")
//    public String list() {
//        return "member/list";
//    }
    // 가입전 약관동의
    @GetMapping("/registCheck.do")
    public String registCheck(
            HttpServletResponse res,
            HttpSession session, RedirectAttributes redirectAttributes) {
        String loginCheck = (String) session.getAttribute("memberId");
        if (loginCheck != null) {
            redirectAttributes.addFlashAttribute("errors", "이미 로그인된 상태입니다. 회원가입 페이지에 접근할 수 없습니다.");
            return "redirect:/";
        }
        session.removeAttribute("termsAgree");

        return "login/registCheck";
    }

    @PostMapping("/registCheck.do")
    public String registCheck(@RequestParam(value = "termsAgreement", defaultValue = "false") boolean termsAgreement, HttpSession session, Model model) {
        if (termsAgreement) {
            session.setAttribute("termsAgree", true);
            return "redirect:/login/regist.do";
        } else {
            model.addAttribute("errors", "약관동의 후 회원가입이 가능합니다");
            return "redirect:/login/registCheck.do";
        }
    }

    @GetMapping("/regist.do")
    public String registGet(HttpSession session,
                            HttpServletResponse res,
                            Model model,RedirectAttributes redirectAttributes) throws IOException {
        Boolean termsAgree = (Boolean) session.getAttribute("termsAgree");
        String loginCheck = (String) session.getAttribute("memberId");
        if(loginCheck != null){
            redirectAttributes.addFlashAttribute("errors", "이미 로그인된 상태입니다. 회원가입 페이지에 접근할 수 없습니다.");
            return "redirect:/";
        }
        if (termsAgree == null || !termsAgree) {
            model.addAttribute("errors", "약관에 동의한 후 회원가입이 가능합니다.");
            return "forward:/login/registCheck.do";
        }
        session.removeAttribute("termsAgree");
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
            , Model model
            , HttpSession session) {
        session.setAttribute("termsAgree", true);

        if(bindingResult.hasErrors()){
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/login/regist.do";
        }

        // 생일로부터 나이를 계산
        if (!memberDTO.isEligibleAge()) {
            redirectAttributes.addFlashAttribute("errors", "만 20세 이상만 가입 가능합니다.");
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/login/regist.do";
        }

        int result = memberService.registMember(memberDTO);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("errors","회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
            return "redirect:/login/login.do";
        } else {
            redirectAttributes.addFlashAttribute("errors", "회원가입에 실패했습니다.");
            return "login/regist";
        }
    }
}
