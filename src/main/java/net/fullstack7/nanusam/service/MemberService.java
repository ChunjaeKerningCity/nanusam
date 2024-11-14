package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.dto.MemberModifyDTO;

public interface MemberService {
    public MemberDTO login(String memberId, String pwd);
    public MemberDTO viewMember(String memberId);
    public boolean pwdCheck(String memberId, String pwd);
    public int registMember(MemberDTO memberDTO);
    public int modifyMember(MemberModifyDTO memberModifyDTO);
    public int deleteMember(String memberId);
    public boolean memberIdCheck(String memberId);
}
