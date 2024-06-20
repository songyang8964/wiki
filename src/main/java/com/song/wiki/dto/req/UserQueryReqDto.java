package com.song.wiki.dto.req;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class UserQueryReqDto extends PageReqDto {

    private String loginName;

}
