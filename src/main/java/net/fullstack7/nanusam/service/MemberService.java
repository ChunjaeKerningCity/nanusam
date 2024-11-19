package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.SecessionMemberVO;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.dto.MemberModifyDTO;
import net.fullstack7.nanusam.dto.SecessionMemberDTO;

public interface MemberService {
    public MemberDTO login(String memberId, String pwd);
    public MemberDTO viewMember(String memberId);
    public boolean pwdCheck(String memberId, String pwd);
    public int registMember(MemberDTO memberDTO);
    public int modifyMember(MemberModifyDTO memberModifyDTO);
    public boolean memberIdCheck(String memberId);
    boolean dontDelete(String memberId);
    void goDelete(String memberId);
    public boolean goodsStatusY(String memberId);
}
