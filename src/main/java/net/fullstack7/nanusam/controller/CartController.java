package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.CartDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.service.CartService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {
    private final CartService cartService;

    @GetMapping("/list.do")
    public String list(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @SessionAttribute("memberId")String memberId,
            Model model) {
        log.info("===============================");
        log.info("CartController >> list START");

//        if (bindingResult.hasErrors()) {
//            log.info("CartController >> list ERROR");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//        }

        if(memberId == null || memberId.isEmpty()) {
            log.info("CartController >> login ERROR");
            return "redirect:/login/login.do";
        }

        pageRequestDTO.setMemberId(memberId);

        PageResponseDTO<CartDTO> pageResponseDTO = cartService.listByPage(pageRequestDTO);
        model.addAttribute("cartList", pageResponseDTO);

        log.info("cartList : "+ pageResponseDTO);
        log.info("CartController >> list END");
        log.info("===========================");

        return "cart/list";
    }

    @GetMapping("/add.do")
    public String addGet(){
        log.info("===========================");
        log.info("add");
        log.info("===========================");
        return "cart/add";
    }
    @PostMapping("/add.do")
    public String addPost(
            @Valid CartDTO dto
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ){
        log.info("============================");
        log.info("addPost");

        if(bindingResult.hasErrors()) {
            log.info("addPost ERROR");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/cart/add.do";
        }
        cartService.add(dto);
        log.info("dto: "+dto);
        log.info("===========================");

        return "redirect:/cart/list.do";
    }

    @GetMapping("delete.do")
    public String deleteGet(
            @RequestParam int idx, RedirectAttributes redirectAttributes
    ){
        cartService.delete(idx);
        log.info("===========================");
        log.info("delete");
        log.info("idx : " + idx);
        log.info("===========================");
        return "redirect:/cart/list.do";
    }
}
