package net.fullstack7.nanusam.service;

import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.BbsVO;
import net.fullstack7.nanusam.domain.MemberVO;
import net.fullstack7.nanusam.dto.AdminDTO;
import net.fullstack7.nanusam.dto.BbsDTO;
import net.fullstack7.nanusam.dto.MemberDTO;
import net.fullstack7.nanusam.mapper.AdminMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
  private final AdminMapper adminXmlmapper;
  private final ModelMapper modelmapper;

  // 관리자 로그인
  @Override
  public boolean adminLogin(String memberId, String pwd) {
    MemberVO memberVO = adminXmlmapper.adminLogin(memberId);
    if (memberVO == null) {
      return false;
    }
    return memberVO.getPwd().equals(pwd);
  }

  // 맴버 전체 조회
  @Override
  public List<AdminDTO> memberList() {
    List<MemberVO> voList = adminXmlmapper.memberList();
    return voList.stream()
        .map(vo -> modelmapper.map(vo, AdminDTO.class))
        .collect(Collectors.toList());
  }

  @Override
  public int getTotalMemberCount() {
    return adminXmlmapper.getTotalMemberCount();
  }

  @Override
  public int getTotalGoodsCount() {
    return adminXmlmapper.getTotalGoodsCount();
  }

  // 맴버 상태 변경
  @Override
  public boolean updateMemberStatus(String memberId, String status) {
    // 상품 상태 확인
    List<String> goodsStatuses = adminXmlmapper.getGoodsStatusByMemberId(memberId);

    // 회원이 등록한 상품이 없는 경우, 상태 변경 가능
    if (goodsStatuses.isEmpty()) {
      log.info("No goods found for memberId {}. Proceeding with status change.", memberId);
      int result = adminXmlmapper.updateMemberStatus(memberId, status);
      return result > 0;
    }

    // 상품 상태가 'R'인 경우 회원 상태 변경 불가
    if (goodsStatuses.contains("R")) {
      log.info("Member status change blocked: Goods status 'R' found for memberId {}", memberId);
      return false;
    }

    // 상품 상태가 'N'인 경우 회원 상태만 변경
    if (goodsStatuses.contains("N")) {
      int result = adminXmlmapper.updateMemberStatus(memberId, status);
      return result > 0;
    }

    // 회원 상태가 'Y' -> 상품 상태 'Y'를 'D'로 변경
    if ("Y".equals(status)) {
      adminXmlmapper.updateGoodsStatusByMemberId(memberId, "D", "Y");
    }

    // 회원 상태가 'N' -> 상품 상태 'D'를 'Y'로 변경
    if ("N".equals(status)) {
      adminXmlmapper.updateGoodsStatusByMemberId(memberId, "Y", "D");
    }

    int result = adminXmlmapper.updateMemberStatus(memberId, status);
    return result > 0;
  }

  // 탈퇴 테이블에 맴버 정보 삽입
  @Override
  public boolean insertSecessionMember(String memberId) {
    int result = adminXmlmapper.insertSecessionMember(memberId);
    return result > 0;
  }

  // 맴버 삭제
  @Override
  public boolean deleteMember(String memberId) {
    int result = adminXmlmapper.deleteMember(memberId);
    return result > 0;
  }

  // 특정 회원의 상품 상태 확인
  @Override
  public List<String> getGoodsStatusByMemberId(String memberId) {
    return adminXmlmapper.getGoodsStatusByMemberId(memberId);
  }

  // 특정 회원의 상품 상태 업데이트
  @Override
  public boolean updateGoodsStatusByMemberId(String memberId, String currentStatus, String newStatus) {
    int result = adminXmlmapper.updateGoodsStatusByMemberId(memberId, currentStatus, newStatus);
    return result > 0;
  }

  // 공지사항 전체 조회
  @Override
  public List<BbsDTO> noticeList() {
    List<BbsVO> voList = adminXmlmapper.noticeList();
    return voList.stream()
        .map(vo -> modelmapper.map(vo, BbsDTO.class))
        .collect(Collectors.toList());
  }
}
