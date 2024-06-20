package com.song.wiki.dto.req;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class DocDeleteReqDto {

    @NotNull(message = "ids 字段不能为 null")
    private List<Long> ids;  // 所有需要被delete的文档id
}
