package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
  MemberVO adminLogin(String memberId);
}
