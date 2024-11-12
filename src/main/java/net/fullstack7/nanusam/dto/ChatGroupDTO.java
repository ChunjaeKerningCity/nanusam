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
public class ChatGroupDTO {
    private int idx;
    private String seller;
    private String customer;
    private int goodsIdx;
    private String sellerDel;
    private String customerDel;
    private LocalDateTime regDate;
    private ChatMessageDTO lastMessage;
}
