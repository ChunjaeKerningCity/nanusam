package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.GoodsDTO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/goods")
public class GoodsController {
    @GetMapping("/list.do")
    public String list() {
        return "goods/list";
    }
    @GetMapping("/regist.do")
    public String registGet(){
        return "goods/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(@Valid GoodsDTO goodsDTO, BindingResult bindingResult){

        return "goods/list";
    }
    @GetMapping("/view.do")
    public String viewGet(){
        return "goods/view";
    }
    @GetMapping("/modify.do")
    public String modifyGet(){
        return "goods/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(){
        return "goods/modify";
    }
    @GetMapping("delete.do")
    public String deleteGet(){
        return "goods/delete";
    }
}
