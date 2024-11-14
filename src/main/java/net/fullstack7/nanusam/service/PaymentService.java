package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.PaymentDTO;

import java.util.List;

public interface PaymentService {
    String regist(PaymentDTO dto);
    List<PaymentDTO> listWithGoodsByBuyer(String buyer);
}
