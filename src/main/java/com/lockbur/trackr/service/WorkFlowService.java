package com.lockbur.trackr.service;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import org.activiti.engine.impl.persistence.entity.TaskEntity;

import java.util.List;

/**
 * Created by wangkun23 on 2017/6/22.
 */
public interface WorkFlowService {

    /**
     * 待办任务列表
     *
     * @return
     */
    public Page<ActTask> todoList(Pageable pageable);
}
