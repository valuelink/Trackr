package com.lockbur.trackr.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 菜单管理
 * <p>
 * Created by wangkun23 on 2017/7/25.
 */
@ToString
public class Menu implements Serializable {

    @Setter
    @Getter
    /* 菜单ID*/
    private Integer id;

    @Setter
    @Getter
    /* 父菜单ID，一级菜单为0*/
    private Integer pid;

    @Setter
    @Getter
    /* 菜单名称*/
    private String name;

    @Setter
    @Getter
    /*菜单URL*/
    private String url;


    @Setter
    @Getter
    /*授权(多个用逗号分隔，如：user:list,user:create)*/
    private String perms;

    @Setter
    @Getter
    /*类型  0：目录 1：菜单 2：按钮*/
    private Integer type;

    @Setter
    @Getter
    /*菜单图标*/
    private String icon;

    @Setter
    @Getter
    /*文件树路径*/
    private String treePath;

    @Setter
    @Getter
    /*排序*/
    private Integer orderNum;

    @Setter
    @Getter
    /*ztree属性*/
    private Boolean open;


    @Setter
    @Getter
    private List<?> list;

    /*时间*/
    @Setter
    @Getter
    private Date createTime;

    @Setter
    @Getter
    private Date updateTime;

}
