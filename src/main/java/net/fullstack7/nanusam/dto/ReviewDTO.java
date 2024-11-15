package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;

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
    @NotBlank(message = "구매자정보없음")
    @Size(min = 1, max = 20, message = "잘못된구매자정보")
    private String buyer;
    @NotBlank(message = "판매자정보없음")
    @Size(min = 1, max = 20, message = "잘못된판매자정보")
    private String seller;
    @NotBlank(message="내용이없음")
    @Size(min = 5, max = 200, message="내용이 너무 길거나 짧음")
    private String content;
    @NotNull(message="1 이상 5 이하 정수만 입력")
    @Min(value=1, message="1 이상 5 이하 정수만 입력")
    @Max(value=5, message="1 이상 5 이하 정수만 입력")
    private Integer score;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private LocalDateTime deleteDate;
    private String regDateStr;
    private String modifyDateStr;
    private String deleteDateStr;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
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
