package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.service.AlertService;
import net.fullstack7.nanusam.util.RestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.MalformedURLException;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/alert")
public class AlertController {
    private final AlertService alertService;
    private final RestUtil restUtil;
    @Autowired
    public AlertController(AlertService alertService) {
        this.alertService = alertService;
        this.restUtil = new RestUtil();
    }

    @GetMapping("/list.do")
    public String list() {
        return "alert/list";
    }
    @GetMapping("/unreadCount.do")
    public String unreadCount(@RequestParam String memberId, Model model) throws MalformedURLException {
        String msg = restUtil.getAsynchroMsg("/alertRest/unreadCount.do");
        if(msg.equals("error")){
            msg = "";
        }
        model.addAttribute("msg", msg);
        return "alert/unreadCount";
    }
}
