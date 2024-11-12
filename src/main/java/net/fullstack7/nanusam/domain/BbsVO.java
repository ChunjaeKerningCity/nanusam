package net.fullstack7.nanusam.domain;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

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
    private String category;
    private String displayDate;
    private LocalDate regDate;
    private LocalDateTime modifyDate;
    private int readCnt;
}
