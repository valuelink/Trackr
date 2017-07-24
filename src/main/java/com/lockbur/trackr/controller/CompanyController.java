package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangkun23 on 2017/7/24.
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyController {

    @RequestMapping("/list")
    public String list() {
        return "/company/list";
    }
}
