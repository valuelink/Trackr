package com.lockbur.trackr.enums;

/**
 * 权限值
 * Created by wangkun23 on 2017/7/25.
 */
public enum AuthorityValue implements BaseEnum {

    //立项管理
    PROJECT_ADD(AuthorityCategory.PROJECT, "立项申请", "project:add"),

    //员工管理
    EMPLOYEE_ADD(AuthorityCategory.EMPLOYEE, "创建新员工", "employee:add"),
    EMPLOYEE_EDIT(AuthorityCategory.EMPLOYEE, "创建新员工", "employee:edit"),

    //其他
    OTHER(AuthorityCategory.OTHER, "其他", "other");


    //基本属性
    private final AuthorityCategory category;
    private final String key;
    private final String value;


    AuthorityValue(AuthorityCategory category, String key, String value) {
        this.category = category;
        this.key = key;
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.key;
    }

    public AuthorityCategory getCategory() {
        return category;
    }

    public String getValue() {
        return value;
    }
}