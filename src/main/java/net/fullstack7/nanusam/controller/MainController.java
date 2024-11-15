package net.fullstack7.nanusam.controller;

import java.util.List;
import javax.sound.sampled.Line.Info;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.service.AdminService;
import net.fullstack7.nanusam.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MainController {
    private final MainService mainService;

    @RequestMapping("/")
    public String main(HttpSession session, Model model) {
        List<GoodsDTO> mainViewGoodsList = mainService.mainViewGoodsList();
        model.addAttribute("mainViewGoodsList", mainViewGoodsList);
        return "main";
    }

    // 무한스크롤

    @GetMapping("/main/directions.do")
    public String directions(){
        return "navigation/directions";
    }

    @GetMapping("/main/cpInfo.do")
    public String cpInfo(){
        return "navigation/cpInfo";
    }
}