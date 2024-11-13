package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.service.BbsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/bbs")
public class BbsController {
    private final BbsService bbsService;

    @GetMapping("/list.do")
    public String list(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        log.info("===============================");
        log.info("BbsController >> list START");

        if (bindingResult.hasErrors()){
            log.info("BbsController >> list ERROR");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO pageResponseDTO = bbsService.listByPage(pageRequestDTO);
        model.addAttribute("bbsList", pageResponseDTO);

        log.info("bbsList : "+ pageResponseDTO);
        log.info("BbsController >> list END");
        log.info("===========================");

        return "bbs/list";
    }
    @GetMapping("/regist.do")
    public String registGet(){
        log.info("===========================");
        log.info("regist");
        log.info("===========================");
        return "bbs/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(
            @Valid BbsDTO dto
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ){
        log.info("===========================");
        log.info("registPOST");

        if(bindingResult.hasErrors()) {
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/bbs/regist.do";
        }
        bbsService.regist(dto);
        log.info("dto : " + dto);
        log.info("===========================");

        return "redirect:/bbs/list.do";
    }
    @GetMapping("/view.do")
    public String viewGet(
            @RequestParam int idx, Model model
    ){
        BbsDTO dto = bbsService.view(idx);
        if(dto != null){
            bbsService.addReadCnt(idx);
        }
        model.addAttribute("dto", dto);

        log.info("===========================");
        log.info("view");
        log.info("idx : " + idx);
        log.info("dto : " + dto);
        log.info("===========================");
        return "bbs/view";
    }

    @GetMapping("/modify.do")
    public String modifyGet(
            @RequestParam int idx, Model model
    ){
        BbsDTO dto = bbsService.view(idx);
        model.addAttribute("dto", dto);

        log.info("===========================");
        log.info("modifyGET");
        log.info("idx : " + idx);
        log.info("dto : " + dto);
        log.info("===========================");
        return "bbs/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(
            @Valid BbsDTO dto
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ){
        log.info("===========================");
        log.info("modifyPOST");

        if(bindingResult.hasErrors()) {
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/bbs/modify.do";
        }
        bbsService.modify(dto);

        log.info("dto : " + dto);
        log.info("===========================");
        return "redirect:/bbs/list.do";
    }
    @GetMapping("delete.do")
    public String deleteGet(
            @RequestParam int idx, RedirectAttributes redirectAttributes
    ){
        bbsService.delete(idx);
        log.info("===========================");
        log.info("delete");
        log.info("idx : " + idx);
        log.info("===========================");
        return "redirect:/bbs/list.do";
    }

}
