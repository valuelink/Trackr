package com.lockbur.trackr.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 工作流管理
 * Created by wangkun23 on 2017/6/22.
 */
@Controller
@RequestMapping("/workflow")
public class WorkFlowController {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping("/tasks/my")
    public String list(Model model) {
        return "/workflow/tasks/my";
    }
}
