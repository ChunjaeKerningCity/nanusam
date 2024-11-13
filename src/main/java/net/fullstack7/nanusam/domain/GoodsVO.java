package net.fullstack7.nanusam.domain;

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
    private int price;
    private String quality;
    private String status;
    private String content;
    private String regDate;
    private String modifyDate;
    private String readCnt;
    private String category;
    private String reservationId;
}
