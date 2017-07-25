package com.lockbur.trackr.model;

import com.lockbur.trackr.domain.Role;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

/**
 * 角色管理
 * Created by wangkun23 on 2017/7/25.
 */
@ToString
public class RoleModel extends Role {

    /**
     * 权限
     */
    @Setter
    @Getter
    private List<String> authorities = new ArrayList<>();
}
