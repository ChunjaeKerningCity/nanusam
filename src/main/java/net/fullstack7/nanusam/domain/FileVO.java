package net.fullstack7.nanusam.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude = "fileData")
public class FileVO {
    private int idx;
    private String fileName;
    private String filePath;
    private int fileSize;
    private String fileExt;
    private String bbsCode;
    private int refIdx;
    private String fileContentType;
    private String orgFileName;
}