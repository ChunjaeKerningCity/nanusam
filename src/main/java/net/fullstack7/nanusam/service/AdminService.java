package net.fullstack7.nanusam.service;

import java.util.List;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.dto.AdminDTO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;

public interface AdminService {
   // admin 로그인
   boolean adminLogin(String memberId, String pwd);

   // admin페이지 맴버 조회
   List<AdminDTO> memberList();

   // 총 회원 수
   int getTotalMemberCount();

   // 총 상품 수
   int getTotalGoodsCount();

   // admin페이지 맴버 상태 변경
   boolean updateMemberStatus(String memberId, String status);

   // admin페이지 맴버 삭제 전 탈퇴 테이블에 삽입
   boolean insertSecessionMember(String memberId);

   // admin페이지 맴버 삭제
   boolean deleteMember(String memberId);

   // 특정 회원의 상품 상태 확인
   List<String> getGoodsStatusByMemberId(String memberId);

   // 특정 회원의 상품 상태 업데이트
   boolean updateGoodsStatusByMemberId(String memberId, String currentStatus, String newStatus);

   // 공지사항 전체 조회
   List<BbsDTO> noticeList();

   // 상품 전체 조회
   List<GoodsDTO> goodsList();

   // 상품 선택 삭제
   boolean deleteGoods(int idx);

   // 상품 상태 변경
   boolean updateGoodsStatus(int idx, String status);
}
