package net.fullstack7.nanusam.mapper;

import java.util.List;
import net.fullstack7.nanusam.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
  // admin 로그인
  MemberVO adminLogin(String memberId);

  // admin페이지 맴버 조회
  List<MemberVO> memberList();
  
  // admin페이지 맴버 상태 변경
  int updateMemberStatus(String memberId, String status);

  // 특정 회원의 상품 상태 확인
  List<String> getGoodsStatusByMemberId(String memberId);

  // 특정 회원의 상품 상태 업데이트
  int updateGoodsStatusByMemberId(String memberId, String currentStatus, String newStatus);

  // admin페이지 맴버 삭제 전 탈퇴 테이블에 삽입
  int insertSecessionMember(String memberId);

  // admin페이지 맴버 삭제
  int deleteMember(String memberId);
}
