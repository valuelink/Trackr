package com.lockbur.trackr.enums;

/**
 * 任务审批结果类型
 * Created by wangkun23 on 2017/7/24.
 */
public enum ApprovalType implements BaseEnum {

    APPROVE("批准"),
    REJECT("驳回"),

    OTHER("其他");

    private final String key;

    private ApprovalType(String key) {
        this.key = key;
    }

    @Override
    public String getKey() {
        return this.key;
    }
}
