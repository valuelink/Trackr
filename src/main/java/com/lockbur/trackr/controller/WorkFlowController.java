package com.lockbur.trackr.controller;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.Task;
import org.activiti.engine.*;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 工作流管理
 * Created by wangkun23 on 2017/6/22.
 */
@Controller
@RequestMapping("/workflow")
public class WorkFlowController {

    private final Logger logger = LoggerFactory.getLogger(getClass());


    @Resource
    RepositoryService repositoryService;

    @Resource
    protected FormService formService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    protected TaskService taskService;

    @Resource
    private HistoryService historyService;


    @Autowired
    protected ProcessEngineFactoryBean processEngine;

    /**
     * 查看待办任务
     *
     * @param model
     * @return
     */
    @RequestMapping("/tasks/my")
    public String list(Model model) {
        return "/workflow/tasks/my";
    }


    /**
     * 办理任务
     *
     * @param model
     * @return
     * @DESC 　一般都要跳转到详情表单页面，然后审批
     */
    @RequestMapping("/tasks/form/{taskId}")
    public String form(@PathVariable("taskId") String taskId, Model model) {
        TaskFormData formData = formService.getTaskFormData(taskId);
        String formKey = formData.getFormKey();
        logger.info("formKey {}", formKey);
        return "redirect:" + formKey + "/" + taskId;
    }


    //完成任务
    @RequestMapping(value = "/complete/{id}", method = RequestMethod.GET)
    public String complete(@PathVariable("id") Integer id) {


        return "/project/approve";
    }

    /**
     * 显示图片
     *
     * @https://my.oschina.net/u/568089/blog/873816
     * @return
     */
    @RequestMapping(value = "/diagram")
    public void diagram(HttpServletResponse response, String processInstanceId) throws Exception {
        HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();


        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());

        List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery()
                .processInstanceId(processInstanceId)
                .list();

        List<String> activeActivityIds=new ArrayList<>();
        for(HistoricTaskInstance history:historicTasks){
            if(history.getEndTime()!=null){
                activeActivityIds.add(history.getTaskDefinitionKey());
            }
        }

//        List<String> activeActivityIds = runtimeService.getActiveActivityIds(executionId);
//        List<String> activeActivityIds = runtimeService.getActiveActivityIds(executionId);
        // 使用spring注入引擎请使用下面的这行代码
        Context.setProcessEngineConfiguration(processEngine.getProcessEngineConfiguration());
        InputStream imageStream = ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len;
        while ((len = imageStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
}