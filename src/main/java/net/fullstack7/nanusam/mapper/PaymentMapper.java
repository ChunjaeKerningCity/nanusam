package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.PaymentVO;

public interface PaymentMapper {
    void regist(PaymentVO payment);
    int deleteByIdx(int idx);
}
