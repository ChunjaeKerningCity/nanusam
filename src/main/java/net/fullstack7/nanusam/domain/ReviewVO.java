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
public class ReviewVO {
    private int idx;
    private String buyer;
    private String seller;
    private String content;
    private int score;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private LocalDateTime deleteDate;
}
