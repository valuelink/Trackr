package com.lockbur.trackr.enums;

/**
 * 权限分类
 * Created by wangkun23 on 2017/7/25.
 */
public enum AuthorityCategory implements BaseEnum {

    PROJECT("立项管理"),
    CONTRACT("合同管理"),


    EMPLOYEE("员工管理"),
    OTHER("其他");

    private final String key;

    private AuthorityCategory(String key) {
        this.key = key;
    }

    @Override
    public String getKey() {
        return this.key;
    }
}