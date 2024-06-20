package com.song.wiki.exception;

/**
 * 枚举业务异常的类型
 */
public enum BusinessExceptionCode {

    USER_LOGIN_NAME_EXIST("he username already exists."),
    LOGIN_USER_ERROR("Username or password is incorrect."),
    VOTE_REPEAT("You have already voted."),
    ;

    private String desc;

    BusinessExceptionCode(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}

