package com.lockbur.trackr.service;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

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


    /**
     * 查询任务详情
     *
     * @param taskId
     * @return
     */
    public ActTask findTaskByTaskId(String taskId);
}
