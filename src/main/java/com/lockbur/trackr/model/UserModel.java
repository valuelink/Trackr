package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.domain.User;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户数据模型
 * Created by wangkun23 on 2017/7/25.
 */
public class UserModel extends User {


    @Setter
    @Getter
    /*用户角色*/
    private Role role;

    @Setter
    @Getter
   /* 附加权限*/
    private List<String> authorities = new ArrayList<>();
}
