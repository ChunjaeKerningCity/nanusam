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
            @SessionAttribute(name="memberId", required = false)String memberId,
            Model model) {
//        log.info("===============================");
//        log.info("CartController >> list START");

        if (bindingResult.hasErrors()) {
//            log.info("CartController >> list ERROR");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if(memberId == null || memberId.isEmpty()) {
//            log.info("CartController >> login ERROR");
            return "redirect:/login/login.do";
        }
        pageRequestDTO.setMemberId(memberId);
        int totalCount = cartService.totalCount(memberId);
        log.info("totalCount : "+ totalCount);

        PageResponseDTO<CartDTO> pageResponseDTO = cartService.listByPage(pageRequestDTO);
        model.addAttribute("cartList", pageResponseDTO);
//        log.info("cartList : "+ pageResponseDTO);
//        log.info("CartController >> list END");
//        log.info("===========================");
        return "cart/list";
    }

//    @GetMapping("/add.do")
//    public String addGet(){
//        log.info("===========================");
//        log.info("add");
//        log.info("===========================");
//        return "cart/add";
//    }
    @GetMapping("/add.do")
    public String addPost(
            @Valid CartDTO dto
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , @RequestParam("goodsIdx") int goodsIdx
            , @RequestParam("memberId") String memberId
    ){
        log.info("============================");
        log.info("addPost");
        dto.setMemberId(memberId);
        dto.setGoodsIdx(goodsIdx);

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            log.info("addPost ERROR");
            return "redirect:/goods/add.do";
        }

        if (cartService.existCart(dto)) {
            // 중복된 상품이 있을 경우, alertMessage만 설정
            if (redirectAttributes.getFlashAttributes().get("alertMessage") == null) {
                redirectAttributes.addFlashAttribute("alertMessage", "장바구니에 해당 상품이 존재합니다.");
            }
            log.info("Alert Message: " + redirectAttributes.getFlashAttributes().get("alertMessage"));
            return "redirect:/goods/list.do";
        } else {
            cartService.add(dto);
            if (redirectAttributes.getFlashAttributes().get("alertMessage") == null) {
                redirectAttributes.addFlashAttribute("alertMessage", "장바구니에 담았습니다.");
            }
            log.info("dto: " + dto);
            log.info("===========================");
        }
        return "redirect:/goods/list.do";
    }

    @GetMapping("delete.do")
    public String deleteGet(
            @RequestParam int idx,
            RedirectAttributes redirectAttributes,
            Model model
    ){
        cartService.delete(idx);
        log.info("===========================");
        log.info("delete");
        log.info("idx : " + idx);
        log.info("===========================");
        redirectAttributes.addFlashAttribute("alertMessage", "상품이 삭제되었습니다.");
        return "redirect:/cart/list.do";
    }
}
