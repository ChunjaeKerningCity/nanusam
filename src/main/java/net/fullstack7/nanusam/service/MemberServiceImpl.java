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

    @Override
    public boolean login(String memberId, String pwd) {
        MemberVO memberVO = memberXmlmapper.login(memberId);
        if (memberVO == null) {
            return false;
        }
        return memberVO.getPwd().equals(pwd);
    }

    @Override
    public MemberDTO viewMember(String memberId) {
        MemberVO memberVO = memberXmlmapper.viewMember(memberId);
        if (memberVO != null) {
            return modelmapper.map(memberVO, MemberDTO.class);
        }
        return null;
    }

    @Override
    public boolean pwdCheck(String memberId) {
        MemberVO memberVO = memberXmlmapper.viewMember(memberId);
        if (memberVO != null) {
            return memberVO.getPwd().equals(memberId);
        }
        return false;
    }

    @Override
    public int registMember(MemberDTO memberDTO) {
        MemberVO memberVO = modelmapper.map(memberDTO, MemberVO.class);
        return memberXmlmapper.registMember(memberVO);
    }

    @Override
    public int modifyMember(MemberDTO memberDTO) {
        MemberVO memberVO = modelmapper.map(memberDTO, MemberVO.class);
        return memberXmlmapper.modifyMember(memberVO);
    }

    @Override
    public int deleteMember(String memberId) {
        return memberXmlmapper.deleteMember(memberId);
    }
}