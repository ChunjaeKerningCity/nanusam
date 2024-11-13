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
public class ChatGroupVO {
    private int idx;
    private String seller;
    private String customer;
    private int goodsIdx;
    private String delChk;
    private LocalDateTime regDate;
}
