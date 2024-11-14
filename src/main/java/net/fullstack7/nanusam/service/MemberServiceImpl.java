package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.MemberVO;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.dto.MemberModifyDTO;
import net.fullstack7.nanusam.dto.SecessionMemberDTO;
import net.fullstack7.nanusam.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberMapper memberXmlmapper;
    private final ModelMapper modelmapper;

    //로그인
    @Override
    public MemberDTO login(String memberId, String pwd) {
        MemberVO memberVO = memberXmlmapper.login(memberId);
        if (memberVO != null && memberVO.getPwd().equals(pwd)) {
            if(memberVO.getStatus().equals("Y")&&memberVO.getMemType().equals("t")){
                return modelmapper.map(memberVO, MemberDTO.class);
            }
        }
        return null;
    }

    //회원정보확인
    @Override
    public MemberDTO viewMember(String memberId) {
        MemberVO memberVO = memberXmlmapper.viewMember(memberId);
        if (memberVO != null) {
            return modelmapper.map(memberVO, MemberDTO.class);
        }
        return null;
    }

    //아이디 중복확인
    @Override
    public boolean memberIdCheck(String memberId) {
        String result = memberXmlmapper.memberIdCheck(memberId);
        return result == null;
    }

    //회원가입
    @Override
    public int registMember(MemberDTO memberDTO) {
//        log.info("regist member");
        MemberVO memberVO = modelmapper.map(memberDTO, MemberVO.class);
       //log.info("memberDTO: {}", memberDTO);
        return memberXmlmapper.registMember(memberVO);
    }

    // 마이페이지 진입전 비밀번호확인
    @Override
    public boolean pwdCheck(String memberId,String pwd) {
        String result = memberXmlmapper.pwdCheck(memberId);
        return result != null && result.equals(pwd);
    }

    //회원정보수정
    @Override
    public int modifyMember(MemberModifyDTO memberModifyDTO) {
        MemberVO memberVO = modelmapper.map(memberModifyDTO, MemberVO.class);
//        log.info("서비스 수정 MemberVO: " + memberVO);
        return memberXmlmapper.modifyMember(memberVO);
    }


    @Override
    public boolean checkGoodsStatus(String memberId, String status) {
        String result = memberXmlmapper.goodsStatusCheck(memberId, status);
        return result != null && Integer.parseInt(result) < 0;
    }

    @Override
    public boolean checkDeliveryStatus(String memberId, String deliveryStatus) {
        String result = memberXmlmapper.deliveryStatusCheck(memberId, deliveryStatus);
        return result != null && Integer.parseInt(result) < 0;
    }

    @Override
    public boolean updateGoodsStatus(String memberId, String status) {
        int result = memberXmlmapper.goodsStatusUpdate(memberId, status);
        return result > 0;
    }

    @Override
    public boolean updateMemberStatus(String memberId) {
        int result = memberXmlmapper.memberStatusUpdate(memberId);
        return result > 0;
    }

    @Override
    public boolean moveToSecessionMember(
            SecessionMemberDTO secessionMemberDTO) {
        int result = memberXmlmapper.insertSecessionMember(secessionMemberDTO.getMemberId());
        return result > 0;
    }

    @Override
    public boolean deleteMemberInfo(String memberId) {
        int result = memberXmlmapper.deleteMember(memberId);
        return result > 0;
    }

        
}