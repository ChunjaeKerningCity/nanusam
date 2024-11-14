package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.MemberVO;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
        log.info("regist member");
        MemberVO memberVO = modelmapper.map(memberDTO, MemberVO.class);
        log.info("memberDTO: {}", memberDTO);
        return memberXmlmapper.registMember(memberVO);
    }

    // 마이페이지 진입전 비밀번호확인
    @Override
    public boolean pwdCheck(String memberId,String pwd) {
        MemberVO memberVO = memberXmlmapper.viewMember(memberId);
        if (memberVO != null) {
            return memberVO.getPwd().equals(pwd);
        }
        return false;
    }
    
    //회원정보수정
    @Override
    public int modifyMember(MemberDTO memberDTO) {
        MemberVO memberVO = modelmapper.map(memberDTO, MemberVO.class);
        return memberXmlmapper.modifyMember(memberVO);
    }

    //회원삭제(본인탈퇴)
    @Override
    public int deleteMember(String memberId) {
        return  0;
//        return memberXmlmapper.deleteMember(memberId);
    }


}