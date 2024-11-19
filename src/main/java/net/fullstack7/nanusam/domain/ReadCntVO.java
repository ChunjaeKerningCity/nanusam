package net.fullstack7.nanusam.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReadCntVO {
    private int idx;
    private String memberId;
    private String bbsNo;
    private int bbsIdx;
}
