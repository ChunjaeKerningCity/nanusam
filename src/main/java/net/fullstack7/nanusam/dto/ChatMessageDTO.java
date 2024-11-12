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
public class ChatMessageDTO {
    private int idx;
    private int groupIdx;
    private String senderId;
    private String content;
    private LocalDateTime regDate;
    private String sellerDel;
    private String customerDel;
}
