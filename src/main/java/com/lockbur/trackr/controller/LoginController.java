package com.lockbur.trackr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录
 * Created by wangkun23 on 2017/7/23.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String displayLogin() {
        return "/login";
    }


}
