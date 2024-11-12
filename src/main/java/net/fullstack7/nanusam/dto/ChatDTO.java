package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatDTO {
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
