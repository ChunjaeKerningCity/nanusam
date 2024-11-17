package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.ChatGroupDTO;
import net.fullstack7.nanusam.dto.ChatMessageDTO;
import net.fullstack7.nanusam.service.ChatService;
import net.fullstack7.nanusam.service.GoodsService;
import net.fullstack7.nanusam.util.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
    private final ChatService chatService;
    private final GoodsService goodsService;
    @GetMapping("/list.do")
    public String chatList(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        log.info("chatList");
        if(session == null || session.getAttribute("memberId") == null) {
            redirectAttributes.addFlashAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/";
        }
        String memberId = (String)session.getAttribute("memberId");
        List<ChatGroupDTO> chatList = chatService.groupDTOList((String)session.getAttribute("memberId"));
        model.addAttribute("chatList", chatList);
        return "chat/list";
    }
    @GetMapping("/view.do")
    public String chatView(@RequestParam(required = false, defaultValue="-1") int groupIdx
            , HttpSession session
            , HttpServletRequest req
            , Model model
            , RedirectAttributes redirectAttributes) {
        log.info("chatView");
        if(session == null || session.getAttribute("memberId") == null) {
            redirectAttributes.addFlashAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/member/login.do";
        }
        if(groupIdx == -1) {
            log.info("groupIdx == -1");
            redirectAttributes.addFlashAttribute("errors","파라미터 오류");
            return "redirect:/chat/list.do";
        }
        ChatGroupDTO chatGroupDTO = chatService.getGroupDTO(groupIdx);
        if(chatGroupDTO == null) {
            redirectAttributes.addFlashAttribute("errors","채팅방 불러오기 실패.");
            log.info("chatGroupDTO is null");
            return "redirect:/chat/list.do";
        }
        String memberId = (String) session.getAttribute("memberId");
        int unreadCount = chatService.countUnreadMessages(chatGroupDTO.getIdx(),memberId);
        log.info("unreadCount : " + unreadCount);
        if(unreadCount>0) {
            int readResult = chatService.readMessages(groupIdx, memberId);
            if (readResult <= 0) {
                redirectAttributes.addFlashAttribute("errors", "메시지 불러오기 실패.");
                log.info("readMessages failed");
                return "redirect:/chat/list.do";
            }
        }
        log.info("goods : "+goodsService.view(chatGroupDTO.getGoodsIdx()));
        List<ChatMessageDTO> chatMessageList = chatService.messageList(groupIdx);
        model.addAttribute("chatGroupDTO", chatGroupDTO);
        model.addAttribute("other", chatGroupDTO.getSeller().equals(memberId)?chatGroupDTO.getCustomer():chatGroupDTO.getSeller());
        model.addAttribute("seller", chatGroupDTO.getSeller());
        model.addAttribute("goodsIdx", chatGroupDTO.getGoodsIdx());
        model.addAttribute("goodsDTO",goodsService.view(chatGroupDTO.getGoodsIdx()));
        model.addAttribute("chatMessageList", chatMessageList);
        model.addAttribute("groupIdx", groupIdx);
        return "chat/view";
    }
    @GetMapping("/fromGoods.do")
    public String chatFromGoods(@RequestParam(required = false, defaultValue = "-1") int goodsIdx
            , @RequestParam String seller
            , HttpSession session
            , RedirectAttributes redirectAttributes
            , Model model) {
        log.info("chatFromGoods");
        if(session == null || session.getAttribute("memberId") == null) {
            redirectAttributes.addFlashAttribute("errors","세션이없습니다.");
            log.info("session is null");
            return "redirect:/";
        }
        String customer = (String) session.getAttribute("memberId");
        if(goodsIdx==-1){
            log.info("goodsIdx == -1");
            redirectAttributes.addFlashAttribute("errors","파라미터 오류");
            return "redirect:/";
        }

        if(seller==null || seller.isEmpty()){
            log.info("seller is null or empty");
            redirectAttributes.addFlashAttribute("errors","파라미터 오류");
            return "redirect:/";
        }

        if(customer.equals(seller)) {
            redirectAttributes.addFlashAttribute("errors","자기자신과 채팅방 생성 불가");
            log.info("customer is seller");
            return "redirect:/goods/view.do?idx="+goodsIdx;
        }

        int result = chatService.getGroupIdx(goodsIdx,customer);
        if(result>0){
            log.info("채팅방이 이미 존재함");
            return "forward:/chat/view.do?groupIdx="+result;
        }

        result = chatService.groupRegist(ChatGroupDTO.builder().seller(seller).customer(customer).goodsIdx(goodsIdx).build());
        if(result<=0){
            model.addAttribute("errors","채팅방 생성실패");
            log.info("채팅방 생성 실패");
            return "redirect:/";
        }
        int groupIdx = chatService.getGroupIdx(goodsIdx,customer);
        log.info("새로생성한 그룹 번호 : " + groupIdx);
        return "forward:/chat/view.do?groupIdx="+groupIdx;
    }

    @GetMapping("/deleteGroup.do")
    public String deleteGroup(@RequestParam int groupIdx, HttpSession session, Model model) {
        log.info("deleteGroup");
        if(session == null || session.getAttribute("memberId") == null) {
            log.info("session is null");
            return "redirect:/";
        }

        int result = chatService.deleteGroup(groupIdx);
        if(result<=0){
            model.addAttribute("errors","채팅방 삭제실패");
            log.info("채팅방삭제실패");
            return "redirect:/chat/view.do?groupIdx="+groupIdx;
        }
        log.info("채팅방삭제성공");
        return "redirect:/chat/list.do";
    }
}
