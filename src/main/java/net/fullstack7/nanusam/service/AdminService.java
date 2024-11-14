package net.fullstack7.nanusam.service;

import java.util.List;
import net.fullstack7.nanusam.dto.AdminDTO;

public interface AdminService {
   // admin 로그인
   public boolean adminLogin(String memberId, String pwd);

   // admin페이지 맴버 조회
   public List<AdminDTO> memberList();

   // admin페이지 맴버 상태 변경
   public boolean updateMemberStatus(String memberId, String status);

   // admin페이지 맴버 삭제 전 탈퇴 테이블에 삽입
   public boolean insertSecessionMember(String memberId);

   // admin페이지 맴버 삭제
   public boolean deleteMember(String memberId);

   // 특정 회원의 상품 상태 확인
   public List<String> getGoodsStatusByMemberId(String memberId);

   // 특정 회원의 상품 상태 업데이트
   public boolean updateGoodsStatusByMemberId(String memberId, String currentStatus, String newStatus);
}
