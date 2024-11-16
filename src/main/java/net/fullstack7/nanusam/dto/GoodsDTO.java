package net.fullstack7.nanusam.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    private Integer price;
    @NotNull
    private String quality;
    @Builder.Default
    private String status = "Y";
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private String readCnt;
    private String category;
    private String reservationId;
    private String mainImageName;

    private List<FileDTO> images;
    private PaymentDTO payInfo;

    // Formatter
    private String regDateStr;
    @Builder.Default
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
        regDateStr = formatter.format(regDate);
    }
    private String modifyDateStr;
    public void setModifyDate(LocalDateTime modifyDate) {
        this.modifyDate = modifyDate;
        if(modifyDate == null) {
            modifyDateStr = "변경 X";
            return;
        }
        modifyDateStr = formatter.format(modifyDate);
    }

    //setIdx 할때 setMainImageName 하는거
    public void setIdx(int idx) {
        this.idx = idx;
        setMainImageName("goods_"+this.idx+"_0.png");
    }
}
