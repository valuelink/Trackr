package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 合同管理 （只要项目立项审批通过都统称合同）
 * Created by wangkun23 on 2017/7/24.
 */
@Controller
@RequestMapping(value = "/contract")
public class ContractController {

    @RequestMapping("/list")
    public String list() {
        return "/contract/list";
    }
}
