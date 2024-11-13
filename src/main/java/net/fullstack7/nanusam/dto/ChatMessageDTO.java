package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    private String delChk;
    private String readChk;
    private String regDateStr;
    private String regTimeStr;
    private DateTimeFormatter dFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private DateTimeFormatter tFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        regDateStr = dFormatter.format(regDate);
        regTimeStr = dFormatter.format(regDate);
    }
}
