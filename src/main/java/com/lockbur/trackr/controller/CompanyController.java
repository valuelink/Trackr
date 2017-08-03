package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 客户管理
 * Created by wangkun23 on 2017/7/24.
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyController {

    @RequestMapping("/list")
    public String list() {
        return "/company/list";
    }


    /**
     * 客户详细信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/detail/{id}")
    public String detail(@ModelAttribute @PathVariable("id") Integer id) {
        return "/company/detail";
    }
}
