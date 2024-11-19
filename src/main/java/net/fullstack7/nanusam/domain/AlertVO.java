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
public class AlertVO {
    private int idx;
    private String memberId;
    private String content;
    private int readChk;
    private LocalDateTime regDate;
}
