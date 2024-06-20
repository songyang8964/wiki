package com.song.wiki.dto.req;

import lombok.Data;

@Data
public class CategorySaveReqDto {
    private Long id;

    private Long parent;

    private String name;

    private Integer sort;
}