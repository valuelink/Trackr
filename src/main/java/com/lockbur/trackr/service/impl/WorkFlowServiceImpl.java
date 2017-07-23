package com.lockbur.trackr.service.impl;

import com.lockbur.trackr.model.ActTask;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource
    private RuntimeService runtimeService;

    @Resource
    HistoryService historyService;


    @Override
    public Page<ActTask> getTodoTasks(Pageable pageable) {
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
    public Page<HistoricTaskInstance> getCompleteTasks(Pageable pageable) {
        HistoricTaskInstanceQuery historicTaskInstanceQuery = historyService.createHistoricTaskInstanceQuery().finished(); // 创建历史任务实例查询
        List<HistoricTaskInstance> list = historicTaskInstanceQuery.listPage(pageable.getPageNow(), pageable.getPageSize());

        Long count = historicTaskInstanceQuery.count();

        Page<HistoricTaskInstance> page = new Page<>(list, count, pageable);

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

    @Override
    public String startProcess(String businessKey) {

        Map<String, Object> variables1 = new HashMap<>();
        variables1.put("requestUser", "申请人测试");

        ProcessInstance instance = runtimeService.startProcessInstanceByKey("projectProcess", businessKey, variables1);
        Task task = taskService.createTaskQuery().processInstanceId(instance.getProcessInstanceId()).singleResult();
        logger.info("start survey.. {}", task.getName());
        Map<String, Object> variables2 = new HashMap<>();

        variables2.put("partner", "王坤");
        taskService.complete(task.getId(), variables2);
        logger.info("start success..");

        return instance.getProcessInstanceId();
    }

    @Override
    public Execution findExecution(String businessKey) {
        Execution execution = runtimeService.createExecutionQuery()
                .processDefinitionKey("projectProcess")
                .processInstanceBusinessKey(businessKey)
                .singleResult();

        return execution;
    }

    @Override
    public void complete(String taskId, String businessKey, String comment) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();

        //添加备注
        taskService.addComment(taskId, task.getProcessInstanceId(), comment);

        taskService.setAssignee(taskId, "王坤完成办理");
        //完成任务
        taskService.complete(taskId);
        /**
         * 在完成任务之后，判断流程是否结束
         如果流程结束了，更新请假单表的状态从1变成2（审核中-->审核完成）
         */
//        ProcessInstance pi = runtimeService.createProcessInstanceQuery()//
//                .processInstanceId(processInstanceId)//使用流程实例ID查询
//                .singleResult();
//        //流程结束了
//        if(pi==null){
//            //更新请假单表的状态从1变成2（审核中-->审核完成）
//            LeaveBill bill = leaveBillDao.findLeaveBillById(id);
//            bill.setState(2);
//        }
    }

}
