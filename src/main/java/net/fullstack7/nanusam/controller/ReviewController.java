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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Objects;

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
            , HttpSession session
            , HttpServletResponse res
            ) {
        res.setCharacterEncoding("UTF-8");
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
        if(memberType.equals("seller")){
            String loginId = (String)session.getAttribute("memberId");
            if(!loginId.equals(memberId)){
                JSFunc.alertBack("정상적인접근이아닙니다.",res);
                return null;
            }
        }
        PageResponseDTO<ReviewDTO> pageResponseDTO = reviewService.listWithPageAndMember(pageRequestDTO,memberType,memberId);
        model.addAttribute("memberType",memberType);
        model.addAttribute("pageDTO",pageResponseDTO);
        model.addAttribute("queryString","memberType="+memberType+"&memberId="+memberId);
        return "review/list";
    }

    @GetMapping("/regist.do")
    public String registGet(@RequestParam(required = false, defaultValue = "")String seller, Model model, HttpSession session,HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        if(seller.isEmpty()){
            JSFunc.alertBack("구매자정보가 없습니다.",response);
            return null;
        }
        model.addAttribute("seller",seller);
        return "review/regist";
    }

    @PostMapping("/regist.do")
    public String registPost(@Valid ReviewDTO reviewDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpSession session,HttpServletResponse response){
        log.info("registPost");
        response.setCharacterEncoding("UTF-8");
        if(bindingResult.hasErrors()){
            log.info("binding error");
            StringBuilder errors = new StringBuilder();
            bindingResult.getAllErrors().forEach(error -> errors.append(error.getDefaultMessage()).append("<br>"));
            log.info(errors);
            JSFunc.alertBack(errors.toString(),response);
            return null;
        }
        log.info("no binding error");
        if(reviewDTO.getBuyer().equals(reviewDTO.getSeller())){
            log.info("seller == buyer");
            JSFunc.alertBack("자신에게 후기 못남김",response);
            return null;
        }
        reviewDTO.setContent(reviewDTO.getContent().replace("\r\n","<br>"));
        int result = reviewService.regist(reviewDTO);
        if(result<=0){
            log.info("regist error");
            JSFunc.alertBack("후기등록실패",response);
            return null;
        }
        model.addAttribute("registFinished","true");
        return "review/regist";
    }
    @GetMapping("/modify.do")
    public String modifyGet(@RequestParam(required = false, defaultValue = "-1") int idx, Model model, HttpSession session,HttpServletResponse response) {
        log.info("modify");
        response.setCharacterEncoding("UTF-8");
        if(idx<0){
            log.info("idx is empty");
            JSFunc.alertBack("인덱스없음",response);
            return null;
        }
        ReviewDTO dto = reviewService.view(idx);
        if(dto==null){
            log.info("review is null");
            JSFunc.alertBack("리뷰조회실패",response);
            return null;
        }
        if(!dto.getBuyer().equals((String)session.getAttribute("memberId"))){
            log.info("자신의 글이 아님");
            JSFunc.alertBack("자신의글이 아님",response);
            return null;
        }
        if(dto.getStatus().equals("N")){
            log.info("삭제된글");
            JSFunc.alertBack("삭제된글임",response);
            return null;
        }
        model.addAttribute("dto",dto);
        return "review/modify";
    }
    @PostMapping("/modify.do")
    public String modifyPost(@Valid ReviewDTO reviewDTO, BindingResult bindingResult, Model model, HttpSession session, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        log.info("modifyPost");
        if(bindingResult.hasErrors()){
            log.info("binding error");
            StringBuilder errors = new StringBuilder();
            bindingResult.getAllErrors().forEach(error -> errors.append(error.getDefaultMessage()).append("<br>"));
            log.info(errors);
            JSFunc.alertBack(errors.toString(),response);
            return null;
        }
        log.info("no binding error");
        ReviewDTO dto = reviewService.view(reviewDTO.getIdx());
        if(dto==null){
            log.info("review is null");
            JSFunc.alertBack("리뷰조회실패",response);
            return null;
        }
        if(!dto.getBuyer().equals((String)session.getAttribute("memberId"))){
            log.info("자신의 글이 아님");
            JSFunc.alertBack("자신의글이 아님",response);
            return null;
        }
        if(dto.getStatus().equals("N")){
            log.info("삭제된글");
            JSFunc.alertBack("삭제된글임",response);
            return null;
        }
        int result = reviewService.modify(reviewDTO);
        if(result<=0){
            log.info("modify error");
            JSFunc.alertBack("수정실패",response);
            return null;
        }
        model.addAttribute("modifyFinished","true");
        return "review/modify";
    }

    @GetMapping("/delete.do")
    public String deleteGet(@RequestParam(required = false, defaultValue = "-1") int idx, Model model, HttpSession session,HttpServletResponse response) {
        log.info("delete");
        response.setCharacterEncoding("UTF-8");
        if(idx<0){
            log.info("idx is empty");
            JSFunc.alertBack("idx 없음",response);
            return null;
        }
        ReviewDTO dto = reviewService.view(idx);
        if(dto==null){
            log.info("review is null");
            JSFunc.alertBack("리뷰조회실패",response);
            return null;
        }
        if(!dto.getBuyer().equals((String)session.getAttribute("memberId"))){
            log.info("자신의 글이 아님");
            JSFunc.alertBack("자신의글이 아님",response);
            return null;
        }
        if(dto.getStatus().equals("N")){
            log.info("삭제된글");
            JSFunc.alertBack("삭제된글임",response);
            return null;
        }
        int result = reviewService.delete(idx);
        if(result<=0){
            log.info("delete error");
            JSFunc.alertBack("삭제실패",response);
            return null;
        }
        log.info("삭제성공");
        return "review/modify";
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
