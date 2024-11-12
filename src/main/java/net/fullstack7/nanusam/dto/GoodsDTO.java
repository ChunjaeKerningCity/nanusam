package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;
import java.util.List;

@Log4j2
@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoodsDTO {
    private int idx;
    @NotNull
    @NotBlank
    private String name;
    private String memberId;
    @PositiveOrZero
    @Min(value=0)
    private int price;
    @NotNull
    private String quality;
    @Builder.Default
    private String status = "N";
    private String regDate;
    private String modifyDate;
    private String readCnt;
    private String category;

    private List<FileDTO> images;
}
