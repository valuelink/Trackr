package com.lockbur.trackr.controller;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.Task;
import org.activiti.engine.FormService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.impl.context.Context;
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
     * @return
     */
    @RequestMapping(value = "/diagram")
    public void diagram(HttpServletResponse response, String executionId) throws Exception {
        // String businessKey = "CT000002";
        // Execution execution = runtimeService.createExecutionQuery().processInstanceBusinessKey(businessKey).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());
        List<String> activeActivityIds = runtimeService.getActiveActivityIds(executionId);
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