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
public class MemberDTO {
    @NotBlank
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9]{4,14}$", message = "아이디는 영문자로 시작하고 5~15자의 영문자와 숫자만 사용 가능합니다.")
    private String memberId;
    @NotBlank
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,20}$", message = "비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력해주세요.")
    private String pwd;
    @NotBlank
    @Pattern(regexp = "^[가-힣]{2,10}$", message = "이름은 한글 2~10자 이내로 입력 가능합니다.")
    private String name;
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
    @Pattern(regexp = "^[0-9]{6}$", message = "우편번호는 숫자만 입력 가능합니다.")
    private String zipCode;             // 우편번호
    private String memType;             // 회원유형 t,a
    private LocalDateTime regDate;
    private LocalDateTime changeDate;
    private String status;              // 회원상태 Y 활성화 N 비활성화
    private LocalDateTime leaveDate;    // 탈퇴일

    private String regDateStr;
    @Builder.Default
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        regDateStr = formatter.format(regDate);
    }

    private String changeDateStr;
    @Builder.Default
    private DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public void setChangeDate(LocalDateTime changeDate) {
        this.changeDate = changeDate;
        if(changeDate == null) {
            changeDateStr = "변경 X";
            return;
        }
        changeDateStr = formatter.format(changeDate);
    }
}
