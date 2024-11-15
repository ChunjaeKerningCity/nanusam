package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.AlertDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.service.AlertService;
import net.fullstack7.nanusam.util.JSFunc;
import net.fullstack7.nanusam.util.RestUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.MalformedURLException;
import java.util.List;

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
    public String list(@RequestParam(required = false, defaultValue = "1") int pageNo, HttpSession session, HttpServletResponse res, Model model) {
        log.info("list");
        String memberId = (String)session.getAttribute("memberId");
        int readResult = alertService.modifyStatus(memberId);
        if(readResult <= 0) {
            log.info("읽기처리실패");
        }
        int offset = (pageNo-1)*10;
        PageResponseDTO<AlertDTO> pageResponseDTO = alertService.listWithPage(memberId, PageRequestDTO.builder()
                .page_no(pageNo)
                        .page_size(10)
                        .page_block_size(5)
                .build());
        log.info("list size : " + pageResponseDTO.getDtoList().size());
        model.addAttribute("pageDTO", pageResponseDTO);
        return "alert/list";
    }
//    @GetMapping("/getList.do")
//    @ResponseBody
//    public String list(@RequestParam(required = false, defaultValue = "") String memberId) {
//        List<AlertDTO> list = alertService.listWithPage(memberId, 0, 10);
//        JSONArray jsonArray = new JSONArray();
//        for (AlertDTO alert : list) {
//            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("content", alert.getContent());
//            jsonObject.put("readChk", alert.getReadChk());
//            jsonObject.put("regDate",alert.getRegDateStr());
//            jsonArray.put(jsonObject);
//        }
//
//        JSONObject result = new JSONObject();
//        result.put("list", jsonArray);
//        return result.toString();
//    }

    @GetMapping("/unreadCount.do")
    @ResponseBody
    public String unreadCount(@RequestParam String memberId) {
        int unreadCount = alertService.unreadCount(memberId);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("unreadCount", unreadCount);
        return jsonResponse.toString();
    }
}
