package com.lockbur.trackr.controller;

import com.lockbur.trackr.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 角色管理
 * Created by wangkun23 on 2017/7/24.
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @RequestMapping("/list")
    public String list() {
        return "/role/list";
    }

    @RequestMapping("/add")
    public String add() {
        return "/role/add";
    }

}
