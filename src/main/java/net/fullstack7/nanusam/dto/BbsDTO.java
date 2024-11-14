package net.fullstack7.nanusam.dto;

import java.time.format.DateTimeFormatter;
import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    private int idx;
    private String memberId;
    @NotBlank(message = "제목을 입력하세요.")
    private String title;
    @NotBlank(message = "내용을 입력하세요.")
    private String content;
    private String bbsCode;
    private String displayDate;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private int readCnt;

    private String regDateStr;
    @Builder.Default
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        regDateStr = formatter.format(regDate);
    }

    private String modifyDateStr;
    @Builder.Default
    private DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public void setModifyDate(LocalDateTime modifyDate) {
        this.modifyDate = modifyDate;
        if(modifyDate == null) {
            modifyDateStr = "변경 X";
            return;
        }
        modifyDateStr = formatter2.format(modifyDate);
    }
}
