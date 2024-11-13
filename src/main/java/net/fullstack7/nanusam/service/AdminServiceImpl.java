package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.MemberVO;
import net.fullstack7.nanusam.mapper.AdminMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
}
