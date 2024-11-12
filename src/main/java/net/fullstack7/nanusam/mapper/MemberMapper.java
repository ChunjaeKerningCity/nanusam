package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {
    MemberVO login(String memberId);
//    MemberVO loginAdmin(String memberId, String memType);   // 관리자 로그인 메서드: memberId와 memType으로 조회
    MemberVO viewMember(String memberId);
    int registMember(MemberVO memberVO);
    String pwdCheck(String memberId);
    int modifyMember(MemberVO memberVO);
    int deleteMember(String memberId);
    int memberIdCheck(String memberId);
}
