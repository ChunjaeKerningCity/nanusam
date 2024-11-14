package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.PaymentDTO;

public interface PaymentService {
    String regist(PaymentDTO dto);

    void checkReservation(String memberId);
}
