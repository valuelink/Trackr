package com.lockbur.trackr.controller;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.FormService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    protected FormService formService;
    @Resource
    private RuntimeService runtimeService;

    @Resource
    RepositoryService repositoryService;

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
     */
    @RequestMapping("/tasks/handle")
    public String handle(@RequestParam("taskId") String taskId, Model model) {
        TaskFormData formData = formService.getTaskFormData(taskId);
        String formKey = formData.getFormKey();
        return "redirect:" + formKey;
    }

    /**
     * 显示图片
     *
     * @return
     */
    @RequestMapping(value = "/diagram")
    public void diagram(HttpServletResponse response) throws Exception {
        String businessKey = "CT000002";
        Execution execution = runtimeService.createExecutionQuery().processInstanceBusinessKey(businessKey).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(execution.getId()).singleResult();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());
        List<String> activeActivityIds = runtimeService.getActiveActivityIds(execution.getId());
        // 使用spring注入引擎请使用下面的这行代码
        InputStream imageStream = ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len;
        while ((len = imageStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
}