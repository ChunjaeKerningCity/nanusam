package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MainController {
    @RequestMapping("/")
    public String main(HttpSession session) {
        return "main";
    }

    @GetMapping("/main/directions.do")
    public String directions(){
        return "navigation/directions";
    }

    @GetMapping("/main/cpInfo.do")
    public String cpInfo(){
        return "navigation/cpInfo";
    }
}
