package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 菜单管理
 * Created by wangkun23 on 2017/7/25.
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController {

    @RequestMapping("/list")
    public String list() {
        return "/menu/list";
    }
}
