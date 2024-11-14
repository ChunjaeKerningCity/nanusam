package net.fullstack7.nanusam.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentVO {
    private int idx;
    private String seller;
    private String buyer;
    private int goodsIdx;
    private LocalDateTime payDate;
    private String name;
    private String email;
    private String phone;
    private String addr1;
    private String addr2;
    private String zipCode;
    private String method;
    private String paymentCompany;
    private String paymentNo;
    private String deliveryStatus;
}
