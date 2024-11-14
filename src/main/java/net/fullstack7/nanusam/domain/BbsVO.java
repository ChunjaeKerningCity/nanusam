package net.fullstack7.nanusam.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
    private int idx;
    private String memberId;
    private String title;
    private String content;
    private String bbsCode;
    private String displayDate;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private int readCnt;
}
