package net.fullstack7.nanusam.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
    @Min(value = 5)
    private String memberId;
    @Min(value = 8)
    private String pwd;
    @Min(value = 2)
    private String name;
    private String email;
    @Min(value = 11)
    private String phone;
    @NotBlank
    private String birthday;            // YYYY-MM-DD
    @NotBlank
    private String addr1;
    @NotBlank
    private String addr2;
    @Min(value = 6)
    private String zipCode;             // 우편번호
    private String memType;             // 회원유형 t,a
    private LocalDateTime regDate;
    private LocalDateTime changeDate;
    private String status;              // 회원상태 Y 활성화 N 비활성화
    private LocalDateTime leaveDate;    // 탈퇴일
}
