package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.ReadCntDTO;
import net.fullstack7.nanusam.service.BbsService;
import net.fullstack7.nanusam.service.ReadCntService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/bbs")
public class BbsController {
    private final BbsService bbsService;
    private final ReadCntService readCntService;
    @GetMapping("/list.do")
    public String list(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
//        log.info("===============================");
//        log.info("BbsController >> list START");

        if (bindingResult.hasErrors()){
            log.info("BbsController >> list ERROR");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/bbs/list.do";
        }

        PageResponseDTO pageResponseDTO = bbsService.listByPage(pageRequestDTO);
        log.info("pageResponseDTO"+pageResponseDTO);
        model.addAttribute("bbsList", pageResponseDTO);

        if (pageResponseDTO == null) {
            log.info("pageResponseDTO is null");
        } else {
            log.info("bbsListStart : " + pageResponseDTO.getPage_no());
        }
//        log.info("BbsController >> list END");
//        log.info("===========================");
        return "bbs/list";
    }
    @GetMapping("/regist.do")
    public String registGet(
            Model model
            , RedirectAttributes redirectAttributes
    ){
        BbsDTO dto = BbsDTO.builder().build();
        model.addAttribute("dto", dto);
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
            return "redirect:/admin/noticeMm.do";
        }
        bbsService.regist(dto);
        log.info("dto : " + dto);
        log.info("===========================");

        return "redirect:/bbs/list.do";
    }
    @GetMapping("/view.do")
    public String viewGet(
            @RequestParam(required = false, defaultValue = "-1") int idx
            , HttpSession session
            , Model model
            , RedirectAttributes redirectAttributes
    ){
        if(idx==-1){
            log.info("idx==null");
            redirectAttributes.addFlashAttribute("errors", "파라미터오류");
            return "redirect:/bbs/list.do";
        }
        BbsDTO dto = bbsService.view(idx);
        if(dto==null){
            log.info("dto == null");
            redirectAttributes.addFlashAttribute("errors", "게시글조회 실패");
            return "redirect:/bbs/list.do";
        }

        int readCntFlag = readCntService.regist(ReadCntDTO
                .builder()
                .memberId((String)session.getAttribute("memberId"))
                .bbsNo("01")
                .bbsIdx(dto.getIdx())
                .build());

        if(readCntFlag>0){
            int readCntResult = bbsService.addReadCnt(dto.getIdx());
            if(readCntResult>0){
                dto.setReadCnt(dto.getReadCnt()+1);
            }
        }else if(readCntFlag==0){
            log.info("readCntFlag == 0 에러확인하셈 조회수증가안시킴");
        }else{
            log.info("조회수증가안시킴");
        }

        model.addAttribute("dto", dto);

//        log.info("===========================");
//        log.info("view");
//        log.info("idx : " + idx);
//        log.info("dto : " + dto);
//        log.info("===========================");
        return "bbs/view";
    }

    @GetMapping("/modify.do")
    public String modifyGet(
            @RequestParam int idx, Model model
            , RedirectAttributes redirectAttributes
//            , @SessionAttribute(name = "memType", required = false) String memType
    ){
        BbsDTO dto = bbsService.view(idx);
        model.addAttribute("dto", dto);

//        if (memType == null || !memType.equals("a")) {
//            log.info("잘못된 접근: memType이 'a'가 아닙니다.");
//            redirectAttributes.addFlashAttribute("errorMessage", "잘못된 접근입니다. 관리자에게 문의하세요.");
//            return "redirect:/bbs/list.do"; // 리스트 페이지로 리디렉션
//        }

//        log.info("===========================");
//        log.info("modifyGET");
//        log.info("idx : " + idx);
//        log.info("dto : " + dto);
//        log.info("===========================");
        return "bbs/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(
            @Valid BbsDTO dto
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
    ){
//        log.info("===========================");
//        log.info("modifyPOST");

        if(bindingResult.hasErrors()) {
            log.info("hasErrors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("idx", dto.getIdx());
            return "redirect:/bbs/modify.do";
        }
        bbsService.modify(dto);

//        log.info("dto : " + dto);
//        log.info("===========================");
        return "redirect:/bbs/view.do?idx="+dto.getIdx();
    }
    @PostMapping("/delete.do")
    public String deleteGet(
            @RequestParam int idx, RedirectAttributes redirectAttributes
    ){
        bbsService.delete(idx);
//        log.info("===========================");
//        log.info("delete");
//        log.info("idx : " + idx);
//        log.info("===========================");
        return "redirect:/admin/noticeMm.do";
    }

}
