package net.fullstack7.nanusam.controller;

import java.util.List;
import javax.sound.sampled.Line.Info;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.service.AdminService;
import net.fullstack7.nanusam.service.GoodsService;
import net.fullstack7.nanusam.service.MainService;
import org.json.JSONArray;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MainController {
    private final MainService mainService;
    private final GoodsService goodsService;

    @GetMapping("/")
    public String main(Model model) {
        List<GoodsDTO> mainViewGoodsList = mainService.mainViewGoodsList(1); // 첫 페이지 로드
        model.addAttribute("mainViewGoodsList", mainViewGoodsList);
        model.addAttribute("categories", goodsService.codeList("goods"));
        return "main";
    }

    // 무한 스크롤을 위한 데이터 로드
    @GetMapping(value = "/loadMoreGoods", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String loadMoreGoods(@RequestParam(value = "page") int page) {
        List<GoodsDTO> goodsList = mainService.mainViewGoodsList(page);
        JSONArray jsonArray = new JSONArray(goodsList);
        return jsonArray.toString();
    }

    @GetMapping("/main/directions.do")
    public String directions(){
        return "navigation/directions";
    }

    @GetMapping("/main/cpInfo.do")
    public String cpInfo(){
        return "navigation/cpInfo";
    }


    @GetMapping("/main/commonArea.do")
    public String commonArea(){
        return "commonArea";
    }

    @GetMapping("/main/commonArea2.do")
    public String commonArea2(){
        return "commonArea2";
    }

    @GetMapping("/main/commonClass.do")
    public String commonClass(){
        return "commonClass";
    }
}