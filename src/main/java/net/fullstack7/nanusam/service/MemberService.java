package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.MemberDTO;


public interface MemberService {
    public boolean login(String memberId, String pwd);
    public MemberDTO viewMember(String memberId);
    public boolean pwdCheck(String memberId, String pwd);
    public int registMember(MemberDTO memberDTO);
    public int modifyMember(MemberDTO memberDTO);
    public int deleteMember(String memberId);
    public boolean memberIdCheck(String memberId);
}
