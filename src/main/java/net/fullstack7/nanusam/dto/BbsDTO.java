package net.fullstack7.nanusam.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

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
    private String title;
    private String content;
    private String category;
    private String displayDate;

    private LocalDate regDate;

    private LocalDateTime modifyDate;
    private int readCnt;
}
