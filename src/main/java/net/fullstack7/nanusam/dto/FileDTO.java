package net.fullstack7.nanusam.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude = "fileData")
public class FileDTO {
    private int idx;
    private String fileName;
    private String filePath;
    private long fileSize;
    private String fileExt;
    private String bbsCode;
    private int refIdx;
    private String fileContentType;
    private String orgFileName;
}
