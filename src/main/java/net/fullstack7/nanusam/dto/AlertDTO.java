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
public class AlertDTO {
    private int idx;
    private String memberId;
    private String content;
    private int readChk;
    private LocalDateTime regDate;
    @Builder.Default
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private String regDateStr;
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        this.regDateStr = formatter.format(regDate);
    }
}
