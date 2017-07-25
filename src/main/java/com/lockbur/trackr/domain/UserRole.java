package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 用户角色管理 暂时只是一对一 方便扩展，以后会对多对
 * Created by wangkun23 on 2017/7/25.
 */
@ToString
public class UserRole implements Serializable {

    @Setter
    @Getter
    private Integer id;

    /**
     * 用户ID
     */
    @Setter
    @Getter
    private Integer userId;

    /**
     * 角色ID
     */
    @Setter
    @Getter
    private Integer roleId;
}
