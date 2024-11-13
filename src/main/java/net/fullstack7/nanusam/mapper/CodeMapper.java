package net.fullstack7.nanusam.mapper;

import net.fullstack7.nanusam.domain.CodeVO;

import java.util.List;

public interface CodeMapper {
    List<CodeVO> list(String type);
}
