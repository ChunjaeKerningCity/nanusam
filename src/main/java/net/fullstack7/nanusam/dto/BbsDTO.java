package net.fullstack7.nanusam.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    private int idx;
    private String memberId;
    @NotEmpty
    private String title;
    @NotEmpty
    private String content;
    private String bbsCode;
    private String displayDate;
    @Future
    private LocalDate regDate;
    @Future
    private LocalDateTime modifyDate;
    private int readCnt;
}
