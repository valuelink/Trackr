package com.lockbur.trackr.utils;

/**
 * 安全等级.
 * <p>
 * 用于密码生成等多处逻辑
 * <p>
 * Created by wangkun on 2016/11/9.
 */
public enum SecurityPasswordLevel {

    KIDDING("极弱"),
    WEAK("弱"),
    MEDIUM("中等"),
    GOOD("好"),
    STRONG("强"),
    EXTREME("极强"),
    PERFECT("完美");

    private final String key;

    private SecurityPasswordLevel(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }
}
