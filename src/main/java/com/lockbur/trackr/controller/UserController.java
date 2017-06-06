package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 用户管理
 * Created by wangkun23 on 2017/6/6.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @RequestMapping("/list")
    public String displayList() {
        return "/user/list";
    }
}
