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
public class ChatVO {
    private int idx;
    private int goodsIdx;
    private String seller;
    private String customer;
    private String content;
    private String senderDel;
    private String receiverDel;
    private LocalDateTime regDate;
    private String readCheck;
}
