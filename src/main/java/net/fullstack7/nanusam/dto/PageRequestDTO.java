package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;

@Log4j2
@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @Positive
    @Min(value=1)
    private int page_no=1;
    @Builder.Default
    @Positive
    @Min(value=1)
    private int page_size=10;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0;
    @Builder.Default
    @Positive
    @Min(value=1)
    private int page_block_size=5;

    public int getPage_skip_count() {
        return (this.page_no -1) * this.page_size;
    }
}
