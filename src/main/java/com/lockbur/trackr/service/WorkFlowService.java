package com.lockbur.trackr.service;

import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import org.activiti.engine.task.Task;

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
    public Page<Task> todoList(Pageable pageable);
}
