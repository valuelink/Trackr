package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.Project;
import com.lockbur.trackr.service.ProjectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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


    @RequestMapping(value = "/list")
    public String search(String keyword, Model model) {
        List<Project> list = projectService.search(keyword);
        model.addAttribute("list", list);
        return "project/list";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Long id, Model model) {
        return "/project/details";
    }

}
