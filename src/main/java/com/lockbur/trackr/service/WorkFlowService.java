package com.lockbur.trackr.service;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import org.activiti.engine.runtime.Execution;

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


    /**
     * 启动流实例
     *
     * @param businessKey
     */
    public void startProcess(String businessKey);


    /**
     * 查询当前执行的
     *
     * @param businessKey
     */
    public Execution findExecution(String businessKey);

    /**
     * 完成任务 审批通过
     * @param taskId
     * @param businessKey
     * @param comment
     */
    public void complete(String taskId, String businessKey, String comment);

}
