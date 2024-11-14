package net.fullstack7.nanusam.dto;

import java.time.format.DateTimeFormatter;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;
import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberModifyDTO {
    private String memberId;
    @NotBlank
    @Pattern(regexp = "^[\\w-]+(?:\\.[\\w-]+)*@[\\w-]+(?:\\.[\\w-]+)*\\.[a-zA-Z]{2,}(\\.[a-zA-Z]{2,5})?$", message = "유효한 이메일 형식으로 입력해주세요.")
    private String email;
    @NotBlank
    @Pattern(regexp = "^[0-9]{11}$", message = "휴대폰 번호는 숫자만 입력 가능합니다.")
    private String phone;
    @NotBlank
    private String birthday;            // YYYY-MM-DD
    @NotBlank
    private String addr1;
    @NotBlank
    private String addr2;
    @NotBlank
    @Pattern(regexp = "^[0-9]{5,6}$", message = "우편번호는 숫자만 입력 가능합니다.")
    private String zipCode;             // 우편번호
    private String memType;             // 회원유형 t,a
    private LocalDateTime regDate;
    private LocalDateTime changeDate;
}
