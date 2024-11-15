package net.fullstack7.nanusam.mapper;

import java.util.List;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.domain.MemberVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
  // admin 로그인
  MemberVO adminLogin(String memberId);

  // 총 회원 수
  int getTotalMemberCount();

  // 총 상품 수
  int getTotalGoodsCount();

  // admin페이지 맴버 조회
  List<MemberVO> memberList();
  
  // admin페이지 맴버 상태 변경
  int updateMemberStatus(@Param("memberId") String memberId, @Param("status") String status);

  // 특정 회원의 상품 상태 확인
  List<String> getGoodsStatusByMemberId(String memberId);

  // 특정 회원의 상품 상태 업데이트
  int updateGoodsStatusByMemberId(@Param("memberId") String memberId,
      @Param("currentStatus") String currentStatus,
      @Param("newStatus") String newStatus);

  // admin페이지 맴버 삭제 전 탈퇴 테이블에 삽입
  int insertSecessionMember(String memberId);

  // admin페이지 맴버 삭제
  int deleteMember(String memberId);
  
  // admin페이지 공지사항 조회
  List<BbsVO> noticeList();

  // admin페이지 상품 조회
  List<GoodsVO> goodsList();

  // admin페이지 상품 삭제
  int deleteGoods(int idx);

  // admin페이지 상품 상태 변경 <- 이건 나중에 합쳐보자 위랑
  int updateGoodsStatus(@Param("idx") int idx, @Param("status") String status);
}
