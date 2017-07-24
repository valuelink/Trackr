package com.lockbur.trackr.model;

import lombok.Getter;
import lombok.Setter;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.HistoricTaskInstanceEntity;

/**
 * 重新定义 历史任务审批记录 带上审批备注
 * Created by wangkun23 on 2017/7/24.
 */
public class HistoricTaskInstanceModel extends HistoricTaskInstanceEntity {

    @Setter
    @Getter
    private String comment;

}
