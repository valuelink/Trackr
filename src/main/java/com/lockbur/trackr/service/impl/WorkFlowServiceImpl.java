package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 工作流引擎管理
 * Created by wangkun23 on 2017/6/22.
 */
@Service
public class WorkFlowServiceImpl implements WorkFlowService {

    @Resource
    TaskService taskService;

    public Page<Task> todoList(Pageable pageable) {
        TaskQuery todoTaskQuery = taskService.createTaskQuery().active().includeProcessVariables().orderByTaskCreateTime().desc();
        // 查询列表
        List<Task> todoList = todoTaskQuery.listPage(pageable.getPageNow(), pageable.getPageSize());
        Long count = todoTaskQuery.count();
        Page<Task> page = new Page<>(todoList, count, pageable);

        return page;
    }
}
