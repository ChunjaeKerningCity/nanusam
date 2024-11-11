package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.service.BbsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return "bbs/regist";
    }
    @PostMapping("/regist.do")
    public String registPost(){
        return "redirect:/bbs/list.do";
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
        return "redirect:/bbs/list.do";
    }
    @GetMapping("delete.do")
    public String deleteGet(){
        return "redirect:/bbs/list.do";
    }
}
