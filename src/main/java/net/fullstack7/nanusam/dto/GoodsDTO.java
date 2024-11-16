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
    @NotBlank(message = "필수 입력 항목입니다.")
    @Size(min = 2, max = 50, message = "필수 입력 항목입니다. (2~50자)")
    private String name;
    private String memberId;
    @PositiveOrZero
    @Min(value=0)
    @NotNull(message = "필수 입력 항목입니다. (0 이상)")
    private Integer price;
    @NotBlank(message = "필수 입력 항목입니다.(상/중/하)")
    @Pattern(regexp = "^[상중하]$", message = "필수 입력 항목입니다.(상/중/하)")
    private String quality;
    @Builder.Default
    private String status = "Y";
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private String readCnt;
    @NotBlank(message = "필수 입력 항목입니다.")
    @Pattern(regexp = "^[0-9]{2}$", message = "정확한 카테고리를 선택하세요.")
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
}
