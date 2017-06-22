package com.lockbur.trackr.controller;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;

/**
 * 工作流管理
 * Created by wangkun23 on 2017/4/25.
 */
@Controller
@RequestMapping("/process")
public class BpmnProcessController {

    private final Logger logger = LoggerFactory.getLogger(getClass());


    @Resource
    RepositoryService repositoryService;

    /**
     * 查看流程定义
     *
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(Model model) {
        List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
        model.addAttribute("list", list);
        return "/process/deploy";
    }


    /**
     * 部署
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "/deploy")
    public String deploy(@RequestParam(value = "file", required = false) MultipartFile file) {
        String fileName = file.getOriginalFilename();
        try {
            InputStream fileInputStream = file.getInputStream();
            repositoryService.createDeployment().addInputStream(fileName, fileInputStream).deploy();
        } catch (Exception ex) {
            logger.error("{}", ex);
        }
        return "redirect:/process/list";
    }

}
