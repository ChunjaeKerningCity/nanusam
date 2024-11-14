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

    // 상품 상태 확인
    boolean checkGoodsStatus(String memberId, String status);
    // 배송 상태 확인
    boolean checkDeliveryStatus(String memberId, String deliveryStatus);
    // 상품 상태 업데이트
    boolean updateGoodsStatus(String memberId, String status);
    // 회원 상태 업데이트
    boolean updateMemberStatus(String memberId);
    // 탈퇴한 회원 정보 tbl_secession_member로 이동
    boolean moveToSecessionMember(SecessionMemberDTO secessionMemberDTO);
    // 기존 테이블에서 회원 정보 N 처리
    boolean deleteMemberInfo(String memberId);

}
