package com.lockbur.trackr.domain;

import com.lockbur.trackr.enums.AuthorityType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色对应的权限表
 * Created by wangkun23 on 2016/12/2.
 */
@Data
public class Authority implements Serializable {

    private Integer id;
    private AuthorityType type;//权限类型
    private Integer typeId; //如果角色，那typeId是角色ID，如果员工就是员工ID
    private String authority;//角色权限 如 ROLE_ADMIN
    private Integer creatorId;//创建人

    //时间
    private Date createTime;
    private Date updateTime;
}
