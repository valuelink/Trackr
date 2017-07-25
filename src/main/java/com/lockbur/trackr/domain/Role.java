package com.lockbur.trackr.domain;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色管理
 * Created by wangkun23 on 2016/12/2.
 */
@Data
@ToString
public class Role implements Serializable {


    private Integer id;
    private String name;//名称
    private String description;// 描述
    private Integer creatorId;//创建人

    //时间
    private Date createTime;
    private Date updateTime;

}
