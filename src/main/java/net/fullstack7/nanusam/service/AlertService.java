package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.domain.AlertVO;
import net.fullstack7.nanusam.dto.AlertDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;

import java.util.List;

public interface AlertService {
    public int regist(AlertDTO dto);
    public List<AlertDTO> listWithPage(String memberId, int offset, int pageSize);
    public int totalCount(String memberId);
    public int modify(AlertDTO dto);
    public Integer unreadCount(String memberId);
}
