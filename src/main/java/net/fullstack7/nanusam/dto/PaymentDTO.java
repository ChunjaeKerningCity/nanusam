package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;
import java.time.LocalDateTime;

@Log4j2
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentDTO {
    private int idx;
    private String seller;
    private String buyer;
    private int goodsIdx;
    private LocalDateTime payDate;
    @NotBlank
    @Pattern(regexp = "^[가-힣]{2,10}$", message = "이름은 한글 2~10자 이내로 입력 가능합니다.")
    private String name;
    @Pattern(regexp = "^[\\w-]+(?:\\.[\\w-]+)*@[\\w-]+(?:\\.[\\w-]+)*\\.[a-zA-Z]{2,}(\\.[a-zA-Z]{2,5})?$", message = "유효한 이메일 형식으로 입력해주세요.")
    private String email;
    @NotBlank
    @Pattern(regexp = "^[0-9]{11}$", message = "휴대폰 번호는 숫자만 입력 가능합니다.")
    private String phone;
    @NotBlank
    private String addr1;
    private String addr2;
    @NotBlank
    @Pattern(regexp = "^[0-9]{5,6}$", message = "우편번호는 숫자만 입력 가능합니다.")
    private String zipCode;
    private String method;
    private String paymentCompany;
    private String paymentNo;
    private String deliveryStatus;

    private GoodsDTO goodsInfo;
}
