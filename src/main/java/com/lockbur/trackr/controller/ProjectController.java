package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.service.ProjectService;
import com.lockbur.trackr.service.WorkFlowService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String details(@PathVariable("id") Integer id, Model model) {
        Project project = projectService.selectByPrimaryKey(id);
        model.addAttribute("project", project);

        String processInstanceId = "601";
        List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId).list();
        model.addAttribute("historicTasks", historicTasks);

        Execution execution = workFlowService.findExecution(project.getId().toString());
        model.addAttribute("execution", execution);

        return "/project/details";
    }

    //项目立项审核页面
    @RequestMapping(value = "/approve/{id}", method = RequestMethod.GET)
    public String approve(@PathVariable("id") Long id, Model model) {
        return "/project/approve";
    }

}
