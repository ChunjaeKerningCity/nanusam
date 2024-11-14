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
public class SecessionMemberVO {
    private String memberId;
    private String pwd;
    private String name;
    private String email;
    private String phone;
    private String birthday;
    private String addr1;
    private String addr2;
    private String zipCode;
    private String memType;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime leaveDate;
    private String description;
}
