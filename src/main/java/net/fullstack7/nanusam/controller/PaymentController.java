package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PaymentDTO;
import net.fullstack7.nanusam.service.GoodsService;
import net.fullstack7.nanusam.service.PaymentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/payment")
public class PaymentController {
    private final PaymentService paymentService;
    private final GoodsService goodsService;

    @GetMapping("list.do")
    public String list(HttpSession session, Model model, @RequestParam PageRequestDTO pageRequestDTO) {

        model.addAttribute("list", paymentService.listWithGoodsByBuyer(session.getAttribute("memberId").toString()));

        return "payment/list";
    }

    @GetMapping("/regist.do")
    public String registGet(@RequestParam(defaultValue = "0") int goodsIdx, HttpSession session, RedirectAttributes redirectAttributes
            , HttpServletRequest request, Model model) {

        String referer = "";
        if (request.getHeader("Referer") != null) {
            referer = request.getHeader("Referer");
        }

        if (goodsIdx == 0) {
            redirectAttributes.addFlashAttribute("errors", "결제할 상품을 선택해주세요.");
            return "redirect:/goods/list.do";
        }

        GoodsDTO item = goodsService.view(goodsIdx);

        if(item == null) {
            redirectAttributes.addFlashAttribute("errors", "등록되지 않은 상품입니다.");
            return "redirect:/goods/list.do";
        }
        model.addAttribute("item", item);

        return "payment/regist";
    }

    @PostMapping("/regist.do")
    public String registPost(HttpSession session, @RequestParam int goodsIdx
            , @Valid PaymentDTO paymentDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        log.info("goodsIdx = " + goodsIdx);
        paymentDTO.setGoodsIdx(goodsIdx);

        if (goodsIdx == 0) {
            redirectAttributes.addFlashAttribute("errors", "결제할 상품을 선택해주세요.");
            return "redirect:/goods/list.do";
        }

        if(bindingResult.hasErrors()) {
            log.info("bindingResult has errors");
            redirectAttributes.addFlashAttribute("formerrors", bindingResult.getAllErrors());
            return "redirect:/payment/regist.do?goodsIdx="+paymentDTO.getGoodsIdx();
        }

        paymentDTO.setBuyer(session.getAttribute("memberId").toString());
        String message = paymentService.regist(paymentDTO);

        if(message != null) {
            redirectAttributes.addFlashAttribute("message", message);
            return "redirect:/payment/regist.do?goodsIdx="+paymentDTO.getGoodsIdx();
        }

        return "redirect:/payment/list.do";
    }
}
