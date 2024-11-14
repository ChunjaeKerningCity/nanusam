package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.ReviewDTO;
import net.fullstack7.nanusam.service.ReviewService;
import net.fullstack7.nanusam.util.JSFunc;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Log4j2
@RequestMapping("/review")
@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService reviewService;

    @GetMapping("/list.do")
    public String list(@RequestParam(required = false, defaultValue = "") String memberType
            , @RequestParam(required = false, defaultValue = "") String memberId
            , @Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
            , HttpServletResponse res
            ) {
        String errors = listValid(pageRequestDTO,memberType);
        if(errors!=null){
            JSFunc.alertBack(errors,res);
            return null;
        }
        if(memberType.isEmpty()){
            JSFunc.alertBack("멤버타입없음",res);
            return null;
        }
        if(memberId.isEmpty()){
            JSFunc.alertBack("멤버아이디없음",res);
            return null;
        }
        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        PageResponseDTO<ReviewDTO> pageResponseDTO = reviewService.listWithPageAndMember(pageRequestDTO,memberType,memberId);
        model.addAttribute("memberType",memberType);
        model.addAttribute("pageDTO",pageResponseDTO);
        model.addAttribute("queryString","memberType="+memberType+"&memberId="+memberId);
        return "review/list";
    }

    @GetMapping("/regist.do")
    public String registGet(Model model){
        return "review/regist";
    }

    @PostMapping("/regist.do")
    public String registPost(@Valid ReviewDTO reviewDTO, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return "review/regist";
        }

        return "redirect:/review/view.do";
    }

    private String listValid(PageRequestDTO pageRequestDTO, String memberType) {
        String orderBy = pageRequestDTO.getOrderBy();
        String orderDir = pageRequestDTO.getOrderDir();
        if(orderBy!=null&&!orderBy.equals("buyer")&&!orderBy.equals("seller")&&!orderBy.equals("score")&&!orderBy.equals("regDate")){
            return "잘못된 정렬조건";
        }
        if(orderDir!=null&&!orderDir.equals("asc")&&!orderDir.equals("desc")){
            return "잘못된 정렬순서";
        }
        if(memberType!=null&&!memberType.equals("seller")&&!memberType.equals("buyer")){
            return "잘못된 멤버타입";
        }
        return null;
    }
}
