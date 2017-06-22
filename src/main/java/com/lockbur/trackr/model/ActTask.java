package com.lockbur.trackr.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by wangkun23 on 2017/6/22.
 */
@Data
public class ActTask implements Serializable {

    private String id;        // 任务编号
    private String name;    // 任务名称
    private String executionId;    // 任务名称
    private String assignee;
    private Date createTime;
    private Date dueDate;

}
