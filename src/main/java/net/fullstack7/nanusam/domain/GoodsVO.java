package net.fullstack7.nanusam.domain;

import java.time.LocalDateTime;
import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoodsVO {
    private int idx;
    private String name;
    private String memberId;
    private Integer price;
    private String quality;
    private String status;
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private String readCnt;
    private String category;
    private String reservationId;
    private String mainImageName;
}
