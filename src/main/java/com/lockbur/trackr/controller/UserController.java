package com.lockbur.trackr.controller;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.model.UserModel;
import com.lockbur.trackr.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 用户管理
 * Created by wangkun23 on 2017/6/6.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {


    @Resource
    private UserService userService;

    @RequestMapping("/list")
    public String list() {
        return "/user/list";
    }

    @RequestMapping("/add")
    public String add() {
        return "/user/add";
    }


    @RequestMapping("/details/{id}")
    public String details(@ModelAttribute @PathVariable("id") Integer id) {
        return "/user/details";
    }
}
