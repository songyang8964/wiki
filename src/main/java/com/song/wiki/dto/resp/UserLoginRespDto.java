package com.song.wiki.dto.resp;

import lombok.Data;

@Data
public class UserLoginRespDto {

    private Long id;

    private String loginName;

    private String name;

    private String token;
}
