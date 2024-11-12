package net.fullstack7.nanusam.dto;

import lombok.*;

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
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private int readCnt;
}
