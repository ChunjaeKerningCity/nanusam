package net.fullstack7.nanusam.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReadCntDTO {
    private int idx;
    private String memberId;
    private String bbsNo;
    private int bbsIdx;
}
