package net.fullstack7.nanusam.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;


@Log4j2
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private String memberId;
    private String pwd;
    private String name;
    private String email;
    private String phone;
    private String birthday;            // YYYY-MM-DD
    private String addr1;
    private String addr2;
    private String zipCode;             // 우편번호
    private String memType;             // 회원유형 t,a
    private LocalDateTime regDate;
    private LocalDateTime changeDate;
    private String status;              // 회원상태 Y 활성화 N 비활성화
    private LocalDateTime leaveDate;    // 탈퇴일


}
