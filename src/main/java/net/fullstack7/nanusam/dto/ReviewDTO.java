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
public class ReviewDTO {
    private int idx;
    private String buyer;
    private String seller;
    private String content;
    private int score;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private LocalDateTime deleteDate;
    private String regDateStr;
    private String modifyDateStr;
    private String deleteDateStr;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        if(regDate == null) return;
        this.regDateStr = FORMATTER.format(regDate);
    }
    public void setModifyDate(LocalDateTime modifyDate) {
        this.modifyDate = modifyDate;
        if(modifyDate == null) return;
        this.modifyDateStr = FORMATTER.format(modifyDate);
    }
    public void setDeleteDate(LocalDateTime deleteDate) {
        this.deleteDate = deleteDate;
        if(deleteDate == null) return;
        this.deleteDateStr = FORMATTER.format(deleteDate);
    }
}
