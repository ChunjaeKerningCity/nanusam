package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.MemberVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {
    MemberVO login(String memberId);
//    MemberVO loginAdmin(String memberId, String memType);   // 관리자 로그인 메서드: memberId와 memType으로 조회
    MemberVO viewMember(String memberId);
    int registMember(MemberVO memberVO);
    String pwdCheck(String memberId);
    int modifyMember(MemberVO memberVO);
    String memberIdCheck(String memberId);
    //탈퇴부분
    int goodsStatusCheck(@Param("memberId") String memberId, @Param("status") String status);
    int deliveryStatusCheck(@Param("memberId") String memberId, @Param("deliveryStatus") String deliveryStatus);
    int goodsStatusY(@Param("memberId") String memberId, @Param("status") String status);
    void goodsStatusUpdate(@Param("memberId") String memberId, @Param("status") String status);
    void memberStatusUpdate(String memberId);
    void insertSecessionMember(String memberId);
    void deleteMember(String memberId);
}
