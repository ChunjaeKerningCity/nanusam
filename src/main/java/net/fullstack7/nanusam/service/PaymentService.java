package net.fullstack7.nanusam.service;

import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.PaymentDTO;

public interface PaymentService {
    String regist(PaymentDTO dto);
    PageResponseDTO<PaymentDTO> listWithGoodsByBuyer(PageRequestDTO pageRequestDTO);
    PaymentDTO view(int idx);
}
