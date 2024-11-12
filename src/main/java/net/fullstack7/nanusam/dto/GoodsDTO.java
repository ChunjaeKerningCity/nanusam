package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

@Log4j2
@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoodsDTO {
    @Positive
    private int idx;
    private String name;
    private String memberId;
    @PositiveOrZero
    private int price;
    private String quality;
    @Builder.Default
    private String status = "N";
    private String regDate;
    private String modifyDate;
    private String readCnt;
    private String category;
}
