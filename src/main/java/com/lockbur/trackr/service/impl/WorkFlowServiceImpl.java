package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.FormService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 工作流引擎管理
 * Created by wangkun23 on 2017/6/22.
 */
@Service
public class WorkFlowServiceImpl implements WorkFlowService {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    TaskService taskService;

    @Resource
    protected FormService formService;

    @Override
    public Page<ActTask> todoList(Pageable pageable) {
        TaskQuery todoTaskQuery = taskService.createTaskQuery().active().orderByTaskCreateTime().desc();
        // 查询列表
        List<Task> result = todoTaskQuery.listPage(pageable.getPageNow(), pageable.getPageSize());
        Long count = todoTaskQuery.count();
        List<ActTask> todoList = new ArrayList<>(result.size());
        for (Task task : result) {
            ActTask entity = new ActTask();

            entity.setId(task.getId());
            entity.setName(task.getName());
            entity.setExecutionId(task.getExecutionId());
            entity.setAssignee(task.getAssignee());
            entity.setCreateTime(task.getCreateTime());
            entity.setDueDate(task.getDueDate());

            todoList.add(entity);
        }
        Page<ActTask> page = new Page<>(todoList, count, pageable);

        return page;
    }


    @Override
    public ActTask findTaskByTaskId(String taskId) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();

        ActTask result = new ActTask();
        result.setId(task.getId());
        result.setName(task.getName());
        result.setExecutionId(task.getExecutionId());
        result.setAssignee(task.getAssignee());
        result.setCreateTime(task.getCreateTime());
        result.setDueDate(task.getDueDate());

        TaskFormData formData = formService.getTaskFormData(taskId);
        String formKey = formData.getFormKey();
        logger.info("formKey {}", formKey);

        return result;
    }
}
