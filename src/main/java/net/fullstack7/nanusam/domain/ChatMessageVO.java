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
public class ChatMessageVO {
    private int idx;
    private int groupIdx;
    private String senderId;
    private String content;
    private LocalDateTime regDate;
    private String sellerDel;
    private String customerDel;
}
