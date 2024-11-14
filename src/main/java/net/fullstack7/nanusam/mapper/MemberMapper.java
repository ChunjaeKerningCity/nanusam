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
    String memberIdCheck(String memberId);
    // 회원탈퇴부분
    // R 상품 있는지 확인
    String goodsStatusCheck(String memberId);
    // 배송상태 확인
    String deliveryStatusCheck(String memberId);

    // 여기까지 있는 경우 탈퇴 및 상태 변경 불가함...

    // Y 상품 D 로전환
    int goodsStatusUpdate(String memberId);
    // 회원상태 전환
    int memberStatusUpdate(String memberId);
    // 테이블 이동
    int insertSecessionMember(String memberId);
    // 기존 테이블에서회원정보 N 처리
    int deleteMember(String memberId);
}
