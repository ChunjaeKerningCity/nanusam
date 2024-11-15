package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.PaymentVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PaymentDTO;

import java.util.List;

public interface PaymentMapper {
    void regist(PaymentVO payment);
    int deleteByIdx(int idx);

    List<PaymentDTO> listWithGoodsByBuyer(PageRequestDTO pageRequestDTO);
    PaymentDTO viewWithGoods(int idx);
    int total_count(PageRequestDTO pageRequestDTO);
    int modifyDeliveryStatus(PaymentVO payment);
}
