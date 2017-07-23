package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricDetail;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wangkun23 on 2017/6/2.
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController {
    private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

    @Resource
    private ProjectService projectService;

    @Resource
    TaskService taskService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private HistoryService historyService;

    @Resource
    WorkFlowService workFlowService;

    @RequestMapping(value = "/list")
    public String list(Model model) {
        return "/project/list";
    }

    /**
     * 立项申请
     *
     * @return
     */
    @RequestMapping("/add")
    public String add(Model model) {
        return "/project/add";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@ModelAttribute @PathVariable("id") Integer id, Model model) {
        return "/project/details";
    }

    //项目立项审核页面
    @RequestMapping(value = "/approve/{taskId}", method = RequestMethod.GET)
    public String approve(@PathVariable("taskId") String taskId, Model model) {


        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();

        String processInstanceId = task.getProcessInstanceId();


        ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId)
                .singleResult();


        String businessKey = pi.getBusinessKey();


        Project project = projectService.selectByPrimaryKey(Integer.parseInt(businessKey));

        model.addAttribute("task", task);
        model.addAttribute("project", project);
        return "/project/approve";
    }


}
