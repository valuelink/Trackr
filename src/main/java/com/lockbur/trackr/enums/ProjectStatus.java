package com.lockbur.trackr.enums;

import com.lockbur.trackr.enums.BaseEnum;

/**
 * Created by wangkun23 on 2017/7/23.
 */
public enum ProjectStatus implements BaseEnum {


    ASSIGNED("处理中"),
    APPROVED("已批准"),
    REJECTED("已驳回"),
    CANCELED("已取消"),
    OTHER("其他");

    private final String key;

    private ProjectStatus(String key) {
        this.key = key;
    }

    @Override
    public String getKey() {
        return this.key;
    }
}
