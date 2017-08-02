package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 潜在客户管理(线索管理)
 * Created by wangkun23 on 2017/8/2.
 */
@Controller
@RequestMapping(value = "/clue")
public class ClueController {

    @RequestMapping("/list")
    public String list() {
        return "/clue/list";
    }

}
