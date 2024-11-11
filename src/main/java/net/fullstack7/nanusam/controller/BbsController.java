package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/bbs")
public class BbsController {
    @GetMapping("/list.do")
    public String list() {
        return "bbs/list";
    }
    @GetMapping("/regist.do")
    public String registGet(){
        return "bbs/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(){
        return "bbs/regist";
    }
    @GetMapping("/view.do")
    public String viewGet(){
        return "bbs/view";
    }
    @GetMapping("/modify.do")
    public String modifyGet(){
        return "bbs/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(){
        return "bbs/modify";
    }
    @GetMapping("delete.do")
    public String deleteGet(){
        return "bbs/delete";
    }
}
