package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoodsDTO {
    private int idx;
    private String name;
    private String memberId;
    private int price;
    private String quality;
    private String status;
    private String regDate;
    private String modifyDate;
    private String readCnt;
    private String category;
}
