package com.song.wiki.dto.resp;

import lombok.Data;

@Data
public class CategoryQueryRespDto {
    private Long id;

    private Long parent;

    private String name;

    private Integer sort;
}